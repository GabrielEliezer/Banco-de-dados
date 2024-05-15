CREATE TABLE Project(
	idProject SERIAL PRIMARY KEY NOT NULL UNIQUE,
	projectName varchar(50) NOT NULL,
	projectDescription text NOT NULL
);

INSERT INTO Project (projectName,projectDescription)VALUES
('ProjetCACHORRO1', 'é um projeto para beneficiar as vidas de 4 patas'),
('ProjetCAVALO1', 'é um projeto para beneficiar as vidas de 4 patas'),
('ProjetPERNILONGO1', 'é um projeto para beneficiar as vidas de 4 patas'),
('ProjetCASCATA1', 'é um projeto para beneficiar as vidas de 4 patas'),
('ProjetMAR1', 'é um projeto para beneficiar as vidas de 4 patas'),
('ProjetRD', 'é um projeto para beneficiar as vidas de 4 patas'),
('ProjetPENTAGON', 'é um projeto para beneficiar as vidas de 4 patas'),
('ProjetEND', 'é um projeto para beneficiar as vidas de 4 patas'),
('ProjetFIM', 'é um projeto para beneficiar as vidas de 4 patas'),
('ProjetCARAMELO', 'é um projeto para beneficiar as vidas de 4 patas');




CREATE TABLE Employee(
	idEmployee SERIAL PRIMARY KEY NOT NULL UNIQUE,
	nameEmployee varchar(100) NOT NULL,
	admissionDate varchar(10) NOT NULL
);

INSERT INTO Employee(nameEmployee,admissionDate) VALUES
('Marcelo Pereira', '19/03/2024'),
('Juliano Cesar', '20/03/2024'),
('Pedro de Cesar', '18/03/2024'),
('Pelé de jesus', '17/03/2024'),
('Gabriel Eliezer', '16/03/2024'),
('Higor agnavir', '15/03/2024'),
('Vitoria caramelo', '14/03/2024'),
('Marcos julian', '13/03/2024'),
('Dellde ryze', '12/03/2024'),
('dragao vermelho', '11/03/2024');


CREATE TABLE Project_Employee(
	idProject SERIAL NOT NULL,
	idEmployee SERIAL NOT NULL 
);

DROP TABLE Project_Employee

ALTER TABLE Project_Employee ADD FOREIGN KEY (idProject) REFERENCES Project
ALTER TABLE Project_Employee ADD FOREIGN KEY (idEmployee) REFERENCES Employee
