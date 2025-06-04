USE HoleInOne;

INSERT INTO Cliente
	(ID_Cliente, Nome, Data_Nascimento, Email, Rua, Cidade)
    VALUES (100, 'Tiago', '2005-12-07', 'tiago@gmail.com', 'Rua_Tiago', 'Barcelos'),
	(101, 'Duarte', '2005-12-27', 'duarte@gmail.com', 'Rua_Duarte', 'Barcelos'),
	(102, 'Luis', '2005-10-14', 'luis@gmail.com', 'Rua_Luis', 'Vila_Verde'),
	(103, 'Joao', '2004-02-10', 'joao@gmail.com', 'Rua_Joao', 'Braga'),
	(104, 'Ana', '2000-01-01', 'ana@gmail.com', 'Rua_Ana', 'Albufeira'),
	(105, 'Maria', '1999-04-07', 'maria@gmail.com', 'Rua_Maria', 'Lisboa'),
	(106, 'Joaquim', '1951-04-14', 'joaquim@gmail.com', 'Rua_Joaquim', 'Porto'),
	(107, 'Carlos', '1990-06-06', 'carlos@gmail.com', 'Rua_Carlos', 'Ponte_Lima'),
	(108, 'Jose', '2005-11-05', 'jose@gmail.com', 'Rua_Jose', 'Lisboa'),
	(109, 'Mariana', '2004-10-15', 'mariana@gmail.com', 'Rua_Mariana', 'Braga'),
	(110, 'Josefina', '1970-07-20', 'josefina@gmail.com', 'Rua_Josefina', 'Braga');
           
INSERT INTO Telefones
      (Telefone, ID_Cliente)
      VALUES (912561490, 100),
			(945189011, 102),
			(938900133, 103),
			(956566570, 104),
			(978154351, 105),
			(914467100, 106),
			(945674411, 107),
			(900981233, 108),
			(967674412, 109),
			(911155567, 110),
			(922278874, 100);
            
INSERT INTO Carro
		(Nr_Carro, Stand, Ano, Nr_Lugares, Custo)
        VALUES (1000, 'Vilamoura', 2017, 4, 25.0),
			(1001, 'Vilamoura', 2020, 4, 25.0),
			(1002, 'Vilamoura', 2016, 2, 15.0),
			(1003, 'Braga', 2013, 2, 15.0),
			(1004, 'Braga', 2015, 2, 15.0),
			(1005, 'Braga', 2021, 4, 25.0),
			(1006, 'Porto', 2017, 4, 25.0),
			(1007, 'Porto', 2013, 2, 15.0),
			(1008, 'Porto', 2016, 4, 25.0),
			(1009, 'Porto', 2009, 2, 15.0);
            
INSERT INTO Funcao
		(ID_Funcao, Designacao)
        VALUES (1, 'Dono'),
			(2, 'Gerente'),
			(3, 'Secretaria');
            
INSERT INTO Funcionario
		(ID_Funcionario, Nome, Telefone, Email, Local_Trabalho, Rua, Cidade, Salario, ID_Funcao)
        VALUES (1, 'Orlando', 911177464, 'orlando@hole.pt', 'Vilamoura', 'Rua_Orlando', 'Vilamoura', 2000.0, 1),
			(2, 'Beatriz', 956894531, 'beatriz@hole.pt', 'Vilamoura', 'Rua_Beatriz', 'Albufeira', 1000.0, 3),
			(3, 'Jose', 912145743, 'jose@hole.pt', 'Vilamoura', 'Rua_Jose', 'Quarteira', 1500.0, 2),
			(4, 'Iara', 976494522, 'iara@hole.pt', 'Porto', 'Rua_Iara', 'Maia', 1000.0, 3),
			(5, 'Rogerio', 900748741, 'rogerio@hole.pt', 'Porto', 'Rua_Rogerio', 'Porto', 1500.0, 2),
			(6, 'Ines', 912345678, 'ines@hole.pt', 'Braga', 'Rua_Ines', 'Barcelos', 1000.0, 3),
			(7, 'Edgar', 925444828, 'edgar@hole.pt', 'Braga', 'Rua_Edgar', 'Carvalhal', 1500.0, 2);
            
INSERT INTO Aluguer
		(Nr_Aluguer, Data_Inicio, Data_Fim, ID_Cliente, ID_Funcionario, Nr_Carro)
        VALUES (69, '2009-08-18', '2009-08-20', 106, 2, 1000),
			(70, '2009-08-23', '2009-08-26', 108, 2, 1005),
			(71, '2009-08-27', '2009-09-01', 101, 4, 1007),
			(72, '2009-09-07', '2009-09-14', 104, 3, 1005),
			(73, '2009-09-13', '2009-09-15', 107, 4, 1000),
			(74, '2009-09-20', '2009-09-29', 105, 5, 1003),
			(75, '2009-09-25', '2009-10-02', 101, 2, 1004),
			(76, '2009-10-01', '2009-10-04', 109, 1, 1001),
			(77, '2009-10-09', '2009-10-16', 100, 6, 1000),
			(78, '2009-10-14', '2009-10-20', 102, 1, 1002),
			(79, '2009-10-25', '2009-11-20', 103, 2, 1007);
        
        
        
        
        
        
        