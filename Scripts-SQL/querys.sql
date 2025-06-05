USE HoleInOne;

-- RM1
-- id = 100
SELECT *
	FROM Cliente
    Where ID_Cliente = 100;
    
-- RM2
-- id = 1
SELECT *
	FROM Funcionario
    WHERE ID_Funcionario = 1;
    
-- RM3
-- id = 69
SELECT *
	FROM Aluguer
	WHERE Nr_Aluguer = 69;

-- RM4
-- listar todos identificadores de cliente, e o seu respetivo nome.
SELECT ID_Cliente, Nome
	FROM Cliente;
    
-- RM5
-- listar os números de alugueres que um determinado cliente fez, bem como o seu identificador e a data de início desses alugueres.
-- id = 100
SELECT Nr_Aluguer, ID_Cliente, Data_Inicio
	FROM Aluguer
	WHERE ID_Cliente = 100;
    
-- RM6
-- listar os nomes de todos os clientes que foram atendidos por um determinado funcionário.
-- id = 1
SELECT C.Nome
	FROM Cliente AS C INNER JOIN (SELECT * FROM Aluguer WHERE ID_Funcionario = 1) AS A
		ON C.ID_Cliente = A.ID_Cliente;
        
-- RM7
-- listar todos os números dos carros que foram alugados por um funcionário que exerce uma determinada função.
-- id = 2
                
SELECT Ca.Nr_Carro
FROM Carro AS Ca
    INNER JOIN Aluguer AS A
        ON Ca.Nr_Carro = A.Nr_Carro
    INNER JOIN (
        SELECT ID_Funcionario
        FROM Funcionario
        WHERE ID_Funcao = 2
    ) AS F
        ON A.ID_Funcionario = F.ID_Funcionario;
                
                
-- -------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------
-- EXTRAS
-- -------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------


-- Mostrar os carros alugados mais de uma vez
-- COUNT(*) -> (Neste caso) conta quandos registos existem para cada Nr_Carro
-- HAVING -> Filtro usado com agregação
SELECT Nr_Carro, COUNT(*) AS Total_Alugueres
	FROM Aluguer
	GROUP BY Nr_Carro
	HAVING COUNT(*) > 1;
    
    
-- Listar todos os funcionários com sua função (designação)
SELECT F.Nome, FC.Designacao
	FROM Funcionario AS F
	INNER JOIN Funcao AS FC 
		ON F.ID_Funcao = FC.ID_Funcao;


--  Listar os funcionários que nunca participaram em alugueres
SELECT F.Nome
	FROM Funcionario AS F
	LEFT JOIN Aluguer AS A 
		ON F.ID_Funcionario = A.ID_Funcionario
	WHERE A.Nr_Aluguer IS NULL;
    
-- Extra 
SELECT table_schema "HoleInOne",
        ROUND(SUM(data_length + index_length) / 1024 / 1024, 1) "DB Size in MB"
	FROM information_schema.tables
	GROUP BY table_schema;


                


