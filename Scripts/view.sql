USE HoleInOne;

-- View
CREATE VIEW NumerosCarrosAlugadosporFuncionárioTipo2 AS
SELECT Ca.Nr_Carro
	FROM Carro AS Ca INNER JOIN
		(Aluguer AS A INNER JOIN (SELECT * FROM Funcionario WHERE ID_Funcao = 2) AS F
			ON A.ID_Funcionario = F.ID_Funcionario)
				ON Ca.Nr_Carro = A.Nr_Carro;
