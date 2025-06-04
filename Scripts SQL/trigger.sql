USE HoleInOne;


DELIMITER $$

-- Ativado sempre que se tenta adicionar um aluguer novo
-- Previne que haja um carro a ser alugado mais que uma vez

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
