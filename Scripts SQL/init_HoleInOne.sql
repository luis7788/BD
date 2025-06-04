DROP DATABASE IF EXISTS HoleInOne;

CREATE DATABASE IF NOT EXISTS HoleInOne;

USE HoleInOne;

CREATE TABLE Cliente(
	ID_Cliente INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Data_Nascimento DATE,
    Email VARCHAR(50),
    Rua VARCHAR(100) NOT NULL,
    Cidade VARCHAR(50) NOT NULL,
    PRIMARY KEY(ID_Cliente)
);

CREATE TABLE Telefones(
	Telefone INT NOT NULL,
    ID_Cliente INT NOT NULL,
    PRIMARY KEY(Telefone, ID_Cliente),
    FOREIGN KEY(ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Carro(
	Nr_Carro INT NOT NULL,
    Stand VARCHAR(20) NOT NULL,
    Ano INT,
    Nr_Lugares INT NOT NULL,
    Custo DECIMAL(4,2) NOT NULL,
    PRIMARY KEY(Nr_Carro)
);

CREATE TABLE Funcao(
	ID_Funcao INT NOT NULL,
    Designacao VARCHAR(20) NOT NULL,
    PRIMARY KEY(ID_Funcao)
);

CREATE TABLE Funcionario(
	ID_Funcionario INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Telefone INT NOT NULL,
    Email VARCHAR(50),
    Local_Trabalho VARCHAR(45),
    Rua VARCHAR(100) NOT NULL,
    Cidade VARCHAR(50) NOT NULL,
    Salario DECIMAL(7,2) NOT NULL,
    ID_Funcao INT NOT NULL,
    PRIMARY KEY(ID_Funcionario),
    FOREIGN KEY(ID_Funcao) REFERENCES Funcao(ID_Funcao)
);

CREATE TABLE Aluguer(
	Nr_Aluguer INT NOT NULL,
    Data_Inicio DATE NOT NULL,
    Data_Fim DATE NOT NULL,
    ID_Cliente INT NOT NULL,
    ID_Funcionario INT NOT NULL,
    Nr_Carro INT NOT NULL,
    PRIMARY KEY(Nr_Aluguer),
    FOREIGN KEY(ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY(ID_Funcionario) REFERENCES Funcionario(ID_Funcionario),
    FOREIGN KEY(Nr_Carro) REFERENCES Carro(Nr_Carro)
);


DELIMITER $$

CREATE PROCEDURE NumerosCarrosAlugadosporFuncionárioTipo(IN Tipo INT)
BEGIN

SELECT Ca.Nr_Carro
	FROM Carro AS Ca INNER JOIN
		(Aluguer AS A INNER JOIN (SELECT * FROM Funcionario WHERE ID_Funcao = Tipo) AS F
			ON A.ID_Funcionario = F.ID_Funcionario)
				ON Ca.Nr_Carro = A.Nr_Carro;
    
END $$


DELIMITER $$

CREATE PROCEDURE Adiciona_User_e_Telefone(IN Id INT, IN Nome VARCHAR(100), IN Nasc DATE, IN Email VARCHAR(50), IN Rua VARCHAR(100), IN Cidade VARCHAR(50), IN Telefone INT)
BEGIN

START TRANSACTION;

INSERT INTO Cliente
	(ID_Cliente, Nome, Data_Nascimento, Email, Rua, Cidade)
    VALUES (Id,Nome,Nasc,Email,Rua,Cidade);

INSERT INTO Telefones
	(Telefone, ID_Cliente)
    VALUES (Telefone, Id);

COMMIT;

END $$


DELIMITER $$

CREATE PROCEDURE MostrarCarrosAlugadosStand(IN aux VARCHAR(20))
BEGIN

SELECT A.Nr_Carro, COUNT(*) AS Numero_de_Alugueres
	FROM Aluguer AS A INNER JOIN Carro AS C
		ON A.Nr_Carro = C.Nr_Carro
    WHERE C.Stand = aux
	GROUP BY Nr_Carro;

END $$


DELIMITER $$

CREATE PROCEDURE ListarFuncionarios_e_Funcao()
BEGIN

SELECT F.Nome, FC.Designacao
	FROM Funcionario AS F
	INNER JOIN Funcao AS FC 
		ON F.ID_Funcao = FC.ID_Funcao;

END $$


DELIMITER $$

CREATE PROCEDURE MostrarAlugueresPorFuncionario()
BEGIN

SELECT F.ID_Funcionario, COUNT(*) AS 'Nº Alugueres'
	FROM Funcionario AS F INNER JOIN Aluguer AS A
		ON F.ID_Funcionario = A.ID_Funcionario
	GROUP BY F.ID_Funcionario;

END $$


DELIMITER $$

CREATE PROCEDURE ApagarAlugueresAntigos(IN aux DATE)
BEGIN

DELETE FROM Aluguer AS A
	WHERE A.Data_Fim < aux;

END $$


-- View
CREATE VIEW NumerosCarrosAlugadosporFuncionárioTipo2 AS
SELECT Ca.Nr_Carro
	FROM Carro AS Ca INNER JOIN
		(Aluguer AS A INNER JOIN (SELECT * FROM Funcionario WHERE ID_Funcao = 2) AS F
			ON A.ID_Funcionario = F.ID_Funcionario)
				ON Ca.Nr_Carro = A.Nr_Carro;
                

CREATE INDEX idx_Datas_Aluguer ON Aluguer(Data_Inicio, Data_Fim);
CREATE INDEX idx_aluguer_Nr_Carro ON Aluguer(Nr_Carro);
CREATE INDEX idx_aluguer_ID_Cliente ON Aluguer(ID_Cliente);
CREATE INDEX idx_aluguer_ID_Funcionario ON Aluguer(ID_Funcionario); 


DELIMITER $$

CREATE TRIGGER VerificarDisponibilidadeCarro

BEFORE INSERT ON Aluguer

FOR EACH ROW

BEGIN
    DECLARE alugado INT;

    SELECT COUNT(*) INTO alugado
    FROM Aluguer
    WHERE Nr_Carro = NEW.Nr_Carro
      AND (
        NEW.Data_Inicio BETWEEN Data_Inicio AND Data_Fim
        OR
        NEW.Data_Fim BETWEEN Data_Inicio AND Data_Fim
        OR
        Data_Inicio BETWEEN NEW.Data_Inicio AND NEW.Data_Fim
        OR
        Data_Fim BETWEEN NEW.Data_Inicio AND NEW.Data_Fim
      );

    IF alugado > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: O carro já está alugado nesse período.';
    END IF;
END $$


DELIMITER $$

CREATE FUNCTION TotalAlugueresCliente(cliente_id INT) RETURNS INT

DETERMINISTIC

BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total 
		FROM Aluguer 
        WHERE ID_Cliente = cliente_id;
    RETURN total;
END $$


DELIMITER $$

CREATE FUNCTION CarroAlugadoAgora(carro_id INT) RETURNS BOOLEAN

DETERMINISTIC

BEGIN
    DECLARE emUso BOOLEAN;
    
    SELECT EXISTS(
        SELECT * 
			FROM Aluguer 
			WHERE Nr_Carro = carro_id 
				AND CURDATE() BETWEEN Data_Inicio AND Data_Fim
    ) INTO emUso;
    RETURN emUso;
END $$