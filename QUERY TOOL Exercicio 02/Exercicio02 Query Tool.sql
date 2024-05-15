CREATE TABLE Turmas(
	idTurma int PRIMARY KEY NOT NULL UNIQUE,
	idProfessor int UNIQUE
);

INSERT INTO Turmas (idTurma, idProfessor)VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);


SELECT * FROM Turmas


CREATE TABLE Turmas_Alunos(
	idTurma int,
	idAluno int	
);

SELECT * FROM Turmas_Alunos

INSERT INTO Turmas_Alunos(idTurma, idAluno) VALUES
(1, 3123),
(2, 3124),
(3, 3125),
(4, 3126),
(5, 3127),
(6, 3128),
(7, 3129),
(8, 3130),
(9, 3131),
(10, 3132);


ALTER TABLE Turmas_Alunos ADD FOREIGN KEY (idTurma) REFERENCES Turmas
ALTER TABLE Turmas_Alunos ADD FOREIGN KEY (idAluno) REFERENCES Alunos


CREATE TABLE Alunos(
	idAluno int PRIMARY KEY NOT NULL UNIQUE,
	nome text,
	data_nascimento varchar (10),
	idCurso int
);

INSERT INTO Alunos (idAluno, nome, data_nascimento,idCurso)VALUES
(3123,'Gabriel3123','24/02/2004',98),
(3124,'Gabriel3124','25/02/2004',99),
(3125,'Gabriel3125','26/02/2004',100),
(3126,'Gabriel3126','27/02/2004',101),
(3127,'Gabriel3127','28/02/2004',102),
(3128,'Gabriel3128','29/02/2004',103),
(3129,'Gabriel3129','01/03/2004',104),
(3130,'Gabriel3130','02/03/2004',105),
(3131,'Gabriel3131','03/03/2004',106),
(3132,'Gabriel3132','04/03/2004',107);



SELECT * FROM Alunos








CREATE TABLE Cursos(
	idCurso int PRIMARY KEY NOT NULL UNIQUE,
	nomeCurso text NOT NULL
);



INSERT INTO Cursos (idCurso, nomeCurso)VALUES
(98,'A D S 98'),
(99,'A D S 99'),
(100,'A D S 100'),
(101,'A D S 101'),
(102,'A D S 102'),
(103,'A D S 103');
(104,'A D S 104'),
(105,'A D S 105'),
(106,'A D S 106'),
(107,'A D S 107');
	


SELECT * FROM Cursos

SELECT * FROM Alunos

Select * FROM Turmas

SELECT * FROM Turmas_Alunos



-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--



