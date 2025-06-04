USE HoleInOne;

GRANT EXECUTE,SHOW VIEW, CREATE VIEW, CREATE ON HoleInOne.* TO Dono;
GRANT CREATE USER ON *.* TO Dono;
GRANT GRANT OPTION ON *.* TO Dono;

GRANT EXECUTE ON PROCEDURE HoleInOne.Adiciona_User_e_Telefone TO Gerente;
GRANT EXECUTE ON PROCEDURE HoleInOne.ApagarAlugueresAntigos TO Gerente;
GRANT EXECUTE ON PROCEDURE HoleInOne.MostrarCarrosAlugadosStand TO Gerente;
GRANT EXECUTE ON FUNCTION HoleInOne.CarroAlugadoAgora TO Gerente;
GRANT EXECUTE ON FUNCTION HoleInOne.TotalAlugueresCliente TO Gerente;
GRANT SHOW VIEW ON HoleInOne.* TO Gerente;
GRANT CREATE VIEW ON HoleInOne.* TO Gerente;

GRANT EXECUTE ON FUNCTION HoleInOne.CarroAlugadoAgora TO Secretario;
GRANT EXECUTE ON FUNCTION HoleInOne.TotalAlugueresCliente TO Secretario;
GRANT EXECUTE ON PROCEDURE HoleInOne.Adiciona_User_e_Telefone TO Secretario;
GRANT EXECUTE ON FUNCTION HoleInOne.TotalAlugueresCliente TO Secretario;
GRANT SHOW VIEW ON HoleInOne.* TO Secretario;



-- REVOKE SHOW VIEW ON HoleInOne.Cliente FROM Secretario;

-- SHOW GRANTS FOR Gerente;
