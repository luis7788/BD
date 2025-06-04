USE HoleInOne;

DELIMITER $$

-- Utilização
-- SELECT TotalAlugueresCliente(100);
-- Retorna o numero total de alugueres feitos por um cliente

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

-- Utilização
-- SELECT CarroAlugadoAgora(1000);
-- Retorna 1 se o carro estiver a ser alugado agora e 0 caso contrario

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

