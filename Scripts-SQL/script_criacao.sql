
CREATE DATABASE IF NOT EXISTS HoleInOne;
-- DROP DATABASE IF EXISTS HoleInOne;
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
    



