USE HoleInOne;

-- Um índice é uma estrutura de dados que acelera a busca por valores em colunas específicas — como um índice no final de um livro.
-- Devem ser criados indexs em colunas de entidades que são bastante usadas

-- Usada no trigger VerificarDisponibilidadeCarro
-- Usada na função CarroAlugadoAgora
CREATE INDEX idx_Datas_Aluguer ON Aluguer(Data_Inicio, Data_Fim);

-- Usada no trigger VerificarDisponibilidadeCarro
-- Usada na função CarroAlugadoAgora
CREATE INDEX idx_aluguer_Nr_Carro ON Aluguer(Nr_Carro);

-- Usada na função TotalAlugueresCliente
CREATE INDEX idx_aluguer_ID_Cliente ON Aluguer(ID_Cliente);

-- Usado no procedimento ListarFuncionariosSemAlugueresRealizados
CREATE INDEX idx_aluguer_ID_Funcionario ON Aluguer(ID_Funcionario); 

-- ALTER TABLE Aluguer DROP INDEX idx_aluguer_Nr_Aluguer;
