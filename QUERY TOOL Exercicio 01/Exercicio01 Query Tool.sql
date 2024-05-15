
	CREATE TABLE Autores(
		uniqueId INT PRIMARY KEY NOT NULL,
		nome TEXT NOT NULL
	);

	INSERT INTO Autores (uniqueId, nome) VALUES
		--(3, 'Gabriel');
		--(4, 'joaoquatro'),
		--(5, 'joaocinco'),
		--(6, 'joaoseis'),
		--(7, 'joaosete');
		(8, 'joaooito'),
		(9, 'joaonove'),
		(10, 'joaodez'),
		(11, 'joaoonze'),
		(12, 'joaodoze');




	CREATE TABLE Livros(
		isbn INT PRIMARY KEY NOT NULL,
		titulo text NOT NULL,
		editora TEXT NOT NULL,
		ano_de_publicacao VARCHAR(10)
	);

	INSERT INTO Livros (isbn,titulo,editora,ano_de_publicacao) VALUES
		--(5546,'cachorros_de_magalhães', 'SENAI', '19.12.2021'),
		--(5647,'besouros_de_magalhães', 'SENAI', '19/12/2021'),
		--(2342,'lagartos_de_magalhães', 'SENAI', '19/12/2021'),
		--(4324,'sapos_de_magalhães', 'SENAI', '19/12/2021'),
		--(8767,'lobisomen_de_magalhães', 'SENAI','19/12/2021');
		(9878,'lontra_de_magalhães', 'SENAI','19/12/2021'),
		(9978,'papagaio_de_magalhães', 'SENAI','19/12/2021'),
		(1234,'cacatua_de_magalhães', 'SENAI','19/12/2021'),
		(4567,'macaco_de_magalhães', 'SENAI','19/12/2021'),
		(8901,'paca_de_magalhães', 'SENAI','19/12/2021');






	CREATE TABLE Autores_Livros(
		isbn int ,
		uniqueId int
	);

	INSERT INTO Autores_Livros (isbn,uniqueId) VALUES
	--(5546, 3),
	--(5647, 4),
	--(2342, 5),
	--(4324, 6),
	--(8767, 7);
	(9878, 8),
	(9978, 9),
	(1234, 10),
	(4567, 11),
	(8901, 12);
	

	SELECT * FROM Autores
	SELECT * FROM Livros
	SELECT * FROM Autores_Livros




	DROP TABLE Livros

	ALTER TABLE Autores_Livros ADD 
	FOREIGN KEY (isbn) REFERENCES Livros;

	ALTER TABLE Autores_Livros ADD 
	FOREIGN KEY (uniqueId) REFERENCES Autores;



	--COMANDO PARA ~~~~ b. Encontrar todos os livros escritos por um autor específico ~~~~~~ ISBN nome da coluna uniqueid NUMERO DO AUTOR
	SELECT isbn FROM Autores_Livros
	WHERE uniqueid = 3
	
	-- COMANDO PARA ~~~~ c. Encontrar todos os autores que escreveram um livro específico ~~~~ 
	
	SELECT uniqueid FROM Autores_Livros 
	WHERE isbn = 5546