USE HoleInOne;

-- ------------------------------------------------------------
-- Cria três 'Roles': Dono, Gerente e Secretaria. 
-- ------------------------------------------------------------

-- DROP ROLE IF EXISTS Dono;
-- DROP ROLE IF EXISTS Gerente;
-- DROP ROLE IF EXISTS Secretario;

CREATE ROLE Dono;
CREATE ROLE Gerente;
CREATE ROLE Secretario;

-- ------------------------------------------------------------
-- Dá todos os privilégios ao Dono. Acesso Total. 
-- ------------------------------------------------------------

GRANT SELECT, INSERT, UPDATE, DELETE
	ON HoleInOne.* TO Dono;


-- --------------------------------------------------------------------------
-- Dá certos privilégios ao Gerente. 
-- --------------------------------------------------------------------------

GRANT SELECT, INSERT, UPDATE, DELETE
	ON HoleInOne.Cliente TO Gerente;

GRANT SELECT, INSERT, UPDATE, DELETE 
	ON HoleInOne.Telefones TO Gerente;

GRANT SELECT, INSERT, UPDATE, DELETE 
	ON HoleInOne.Aluguer TO Gerente;

GRANT SELECT, INSERT, UPDATE, DELETE 
	ON HoleInOne.Carro TO Gerente;

-- --------------------------------------------------------------------------
-- Dá poucas permissões à Secretária.
-- --------------------------------------------------------------------------

GRANT INSERT, SELECT ON HoleInOne.Cliente TO Secretario;
GRANT INSERT, SELECT ON HoleInOne.Telefones TO Secretario;
GRANT INSERT, SELECT ON HoleInOne.Aluguer TO Secretario;



-- RC1 O Dono da empresa deve ter permissão para acrescentar, modificar, apagar e ler registos no sistema.
-- RC2 Todos os funcionários com a função ou cargo de Gerente devem ter permissão para acrescentar, modificar, apagar e ler registos dos Clientes no sistema.
-- RC3 Todos os funcionários com a função ou cargo de Gerente devem ter permissão para acrescentar, modificar, apagar e ler registos dos Alugueres no sistema.
-- RC4 Todos os funcionários com a função ou cargo de Gerente devem ter permissão para acrescentar, modificar, apagar e ler registos dos Carros no sistema.
-- RC5 Todos os Secretários tem permissão para acrescentar e ler registos de Clientes no sistema.
-- RC6 Todos os Secretários tem permissão para acrescentar e ler registos de Alugueres no sistema.
-- RC7 Apenas o Dono/Fundador tem permissão para interagir com os registos dos Funcionários.