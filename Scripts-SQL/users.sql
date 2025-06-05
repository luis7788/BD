USE HoleInOne;

-- Criação de utilizadores

CREATE USER 'Orlando'@'localhost' IDENTIFIED BY 'BD_e_vida_123456_ffff';

CREATE USER 'EdgarNovo'@'localhost' IDENTIFIED BY 'Rei_das_pikenas_987654_ffff';

CREATE USER 'Beatriz'@'localhost' IDENTIFIED BY 'Princesadasarabias_135791_ffff';

-- Grant roles

GRANT Dono TO 'Orlando'@'localhost';
GRANT Gerente TO 'EdgarNovo'@'localhost';
GRANT Secretario TO 'Beatriz'@'localhost';

SET DEFAULT ROLE Dono TO 'Orlando'@'localhost';
SET DEFAULT ROLE Gerente TO 'EdgarNovo'@'localhost';
SET DEFAULT ROLE Secretario TO 'Beatriz'@'localhost';

-- DROP USER 'Orlando'@'localhost';
-- DROP USER 'EdgarNovo'@'localhost';
-- DROP USER 'Beatriz'@'localhost';

-- SELECT CURRENT_ROLE();

