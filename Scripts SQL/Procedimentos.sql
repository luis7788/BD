USE HoleInOne;


-- Procedimento 1
-- Numeros Carros Alugados Por Gerente, Secretario, Dono...
DELIMITER $$

CREATE PROCEDURE NumerosCarrosAlugadosporFuncionárioTipo(IN Tipo INT)
BEGIN

SELECT Ca.Nr_Carro
	FROM Carro AS Ca INNER JOIN
		(Aluguer AS A INNER JOIN (SELECT * FROM Funcionario WHERE ID_Funcao = Tipo) AS F
			ON A.ID_Funcionario = F.ID_Funcionario)
				ON Ca.Nr_Carro = A.Nr_Carro;
    
END $$





-- Procedimento 2
DELIMITER $$
-- Adiciona um User e Telefone de acordo com os argumentos
-- Feito numa transcao
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




-- Procedimento 3
-- Mostrar os carros alugados
DELIMITER $$

CREATE PROCEDURE MostrarCarrosAlugadosStand(IN aux VARCHAR(20))
BEGIN

SELECT A.Nr_Carro, COUNT(*) AS Numero_de_Alugueres
	FROM Aluguer AS A INNER JOIN Carro AS C
		ON A.Nr_Carro = C.Nr_Carro
    WHERE C.Stand = aux
	GROUP BY Nr_Carro;

END $$




-- Procedimento 4
-- Listar todos os funcionários com a sua função (designação)
DELIMITER $$

CREATE PROCEDURE ListarFuncionarios_e_Funcao()
BEGIN

SELECT F.Nome, FC.Designacao
	FROM Funcionario AS F
	INNER JOIN Funcao AS FC 
		ON F.ID_Funcao = FC.ID_Funcao;

END $$




-- Procedimento 5
-- Mostrar o número de alugueres realizados por funcionário
DELIMITER $$

CREATE PROCEDURE MostrarAlugueresPorFuncionario()
BEGIN

SELECT F.ID_Funcionario, COUNT(*) AS 'Nº Alugueres'
	FROM Funcionario AS F INNER JOIN Aluguer AS A
		ON F.ID_Funcionario = A.ID_Funcionario
	GROUP BY F.ID_Funcionario;

END $$





-- Procedimento 6
-- Remover alugueres mais antigos que uma determinada data

DELIMITER $$

CREATE PROCEDURE ApagarAlugueresAntigos(IN aux DATE)
BEGIN

DELETE FROM Aluguer AS A
	WHERE A.Data_Fim < aux;

END $$

