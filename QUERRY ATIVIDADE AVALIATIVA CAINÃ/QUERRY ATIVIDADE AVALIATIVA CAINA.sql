--COMANDOS DDL (DATA DEFINITION LANGUAGE)


CREATE TABLE emails_novos (
    idEmail serial PRIMARY KEY,
    email varchar(100)
);

CREATE TABLE telefones_novos (
    idTelefone serial PRIMARY KEY,
    telefone varchar(100)
);

CREATE TABLE contatos_novos (
    idContato serial PRIMARY KEY,
    idEmail serial, 
    CONSTRAINT fk_email_novo FOREIGN KEY (idEmail) REFERENCES emails_novos (idEmail),
    idTelefone serial,
    CONSTRAINT fk_telefone_novo FOREIGN KEY (idTelefone) REFERENCES telefones_novos (idTelefone)
);

CREATE TABLE enderecos_novos (
    idEndereco serial PRIMARY KEY,
    logradouro varchar(50),
    numero integer,
    cidade varchar(50),
    estado varchar(50),
    pais varchar(50)
);

CREATE TABLE estudantes (
    registroAcademico INTEGER PRIMARY KEY UNIQUE,
    idEndereco serial,
    CONSTRAINT fk_endereco_novo FOREIGN KEY (idEndereco) REFERENCES enderecos_novos (idEndereco),
    idContato serial,
    CONSTRAINT fk_contato_novo FOREIGN KEY (idContato) REFERENCES contatos_novos (idContato),
    nome varchar(50),
    cpf varchar(11) UNIQUE,
    idade integer,
    graduado boolean
);

CREATE TABLE departamentos_novos (
    idDepartamento serial PRIMARY KEY,
    nomeDepartamento varchar (50)
);

CREATE TABLE cursos_novos (
    idCurso serial PRIMARY KEY,
    nomeCurso varchar(50),
    idDepartamento serial,
    CONSTRAINT fk_departamento_novo FOREIGN KEY (idDepartamento) REFERENCES departamentos_novos (idDepartamento)
);

CREATE TABLE disciplinas_novas (
    idDisciplina serial PRIMARY KEY,
    nomeDisciplina varchar (50),
    opcional boolean
);

CREATE TABLE matriculas (
    idMatricula serial PRIMARY KEY,
    registroAcademico serial,
    CONSTRAINT fk_estudantes FOREIGN KEY (registroAcademico) REFERENCES estudantes (registroAcademico),
    idCurso serial,
    CONSTRAINT fk_curso_novo FOREIGN KEY (idCurso) REFERENCES cursos_novos (idCurso),
    idDisciplina serial,
    CONSTRAINT fk_disciplina_novo FOREIGN KEY (idDisciplina) REFERENCES disciplinas_novas (idDisciplina)
);




--COMANDOS DML (DATA MANIPULATION LANGUAGE)

INSERT INTO emails_novos (email) VALUES 
('joaodasilva@gmail.com'),
('mariaoliveira@hotmail.com'),
('pedroribeiro@gmail.com'),
('anapaula@gmail.com'),
(''),
('fernandocarvalho@gmail.com'),
('clararamos@hotmail.com'),
('luisalmeida@gmail.com'),
(''),
('andreluiz@gmail.com');

INSERT INTO telefones_novos (telefone) VALUES 
('11987654321'),
(''),
('11991234567'),
('11996543210'),
('11995432109'),
('11998765432'),
(''),
('11993216547'),
('11998456321'),
('11997654321');

INSERT INTO contatos_novos (idEmail, idTelefone) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO enderecos_novos (logradouro, numero, cidade, estado, pais) VALUES 
('Avenida Brasil','123','São Paulo','SP','Brasil'),
('Rua das Flores','456','Rio de Janeiro','RJ','Brasil'),
('Praça da Liberdade','789','Belo Horizonte','MG','Brasil'),
('Avenida Paulista','101','São Paulo','SP','Brasil'),
('Rua 7 de Setembro','202','Porto Alegre','RS','Brasil'),
('Rua XV de Novembro','303','Curitiba','PR','Brasil'),
('Rua da Praia','404','Florianópolis','SC','Brasil'),
('Rua das Palmeiras','505','Recife','PE','Brasil'),
('Rua dos Andradas','606','Porto Alegre','RS','Brasil'),
('Rua Augusta','707','São Paulo','SP','Brasil');

INSERT INTO estudantes (registroAcademico, idEndereco, idContato, nome, cpf, idade, graduado) VALUES
(1001, 1, 1, 'João da Silva', '11111111111', 20, false),
(1002, 2, 2, 'Maria Oliveira', '22222222222', 22, true),
(1003, 3, 3, 'Pedro Ribeiro', '33333333333', 21, false),
(1004, 4, 4, 'Ana Paula', '44444444444', 23, true),
(1005, 5, 5, 'Fernando Carvalho', '55555555555', 19, false),
(1006, 6, 6, 'Clara Ramos', '66666666666', 24, true),
(1007, 7, 7, 'Luis Almeida', '77777777777', 25, false),
(1008, 8, 8, 'André Luiz', '88888888888', 18, true),
(1009, 9, 9, 'Carla Santos', '99999999999', 27, false),
(1010, 10, 10, 'Paulo Henrique', '00000000000', 26, true);

INSERT INTO departamentos_novos (nomeDepartamento) VALUES
('Ciências da Saúde'),
('Tecnologia da Informação'),
('Engenharia'),
('Ciências Humanas');

INSERT INTO cursos_novos (nomeCurso, idDepartamento) VALUES
('Medicina', 1),
('Enfermagem', 1),
('Biomedicina', 1),
('Farmácia', 1),
('Engenharia de Software', 2),
('Sistemas de Informação', 2),
('Ciência da Computação', 2),
('Segurança da Informação', 2),
('Engenharia Civil', 3),
('Engenharia Mecânica', 3),
('Engenharia Química', 3),
('Engenharia de Produção', 3),
('Direito', 4),
('Psicologia', 4),
('Sociologia', 4),
('Letras', 4);

INSERT INTO disciplinas_novas (nomeDisciplina, opcional) VALUES
('Matemática Avançada', false),
('Física Moderna', false),
('História Geral', true),
('Geopolítica', true),
('Genética', false),
('Literatura Inglesa', true),
('Anatomia Comparada', false),
('Desenho Técnico', true),
('Química Inorgânica', false),
('Filosofia', true);

INSERT INTO matriculas (registroAcademico, idCurso, idDisciplina) VALUES
(1001, 6, 1),
(1001, 6, 6),
(1002, 10, 9),
(1003, 7, 1),
(1004, 3, 5),
(1004, 3, 7),
(1005, 8, 1),
(1006, 2, 7),
(1007, 14, 10),
(1008, 9, 2),
(1009, 10, 2),
(1010, 1, 5),
(1010, 1, 7),
(1001, 5, 1),
(1002, 13, 10),
(1003, 12, 1),
(1004, 15, 10),
(1004, 15, 4),
(1005, 16, 3),
(1006, 6, 1),
(1006, 6, 1),
(1006, 6, 6),
(1007, 12, 1),
(1008, 14, 10),
(1009, 13, 10),
(1010, 9, 2);



-- COMANDOS DQL (DATA QUERRY LANGUAGE)

SELECT * FROM estudantes;
SELECT * FROM matriculas;
SELECT * FROM contatos_novos;
SELECT * FROM cursos_novos;
SELECT * FROM departamentos_novos;
SELECT * FROM disciplinas_novas;
SELECT * FROM emails_novos;
SELECT * FROM enderecos_novos;
SELECT * FROM telefones_novos;

-- Dado o registro acadêmico ou o nome do estudante, buscar no BD todos os demais dados do estudante.
SELECT cpf, idade, graduado, logradouro, numero, cidade, estado, pais, email, telefone 
FROM (estudantes NATURAL INNER JOIN enderecos_novos) 
INNER JOIN contatos_novos USING (idContato)
LEFT JOIN emails_novos USING (idEmail) 
LEFT JOIN telefones_novos USING (idTelefone)
WHERE nome='João da Silva' OR registroAcademico=1001;

-- Dado o nome de um departamento, exibir o nome de todos os cursos associados a ele.
SELECT nomeCurso 
FROM (cursos_novos NATURAL INNER JOIN departamentos_novos) 
WHERE nomeDepartamento='Tecnologia da Informação';

-- Dado o nome de uma disciplina, exibir a qual ou quais cursos ela pertence.
SELECT DISTINCT nomeCurso 
FROM (matriculas NATURAL INNER JOIN cursos_novos) 
INNER JOIN disciplinas_novas USING (idDisciplina)
WHERE nomeDisciplina='Matemática Avançada';

-- Dado o CPF de um estudante, exibir quais disciplinas ele está cursando.
SELECT DISTINCT nomeDisciplina 
FROM (matriculas NATURAL INNER JOIN disciplinas_novas) 
INNER JOIN estudantes USING (registroAcademico)
WHERE cpf='11111111111';

-- Filtrar todos os estudantes matriculados em um determinado curso.
SELECT nome 
FROM (matriculas NATURAL INNER JOIN estudantes) 
INNER JOIN cursos_novos USING (idCurso)
WHERE nomeCurso='Engenharia de Software';

-- Filtrar todos os estudantes matriculados em determinada disciplina.
SELECT nome 
FROM (matriculas NATURAL INNER JOIN estudantes) 
INNER JOIN disciplinas_novas USING (idDisciplina)
WHERE nomeDisciplina='Física Moderna';

-- Filtrar estudantes graduados.
SELECT nome 
FROM estudantes 
WHERE graduado=true;

-- Filtrar estudantes não graduados (ativos).
SELECT nome 
FROM estudantes 
WHERE graduado=false;

-- Apresentar a quantidade de estudantes ativos por curso.
SELECT nomeCurso, COUNT(*) AS quantidade 
FROM (matriculas NATURAL INNER JOIN estudantes) 
INNER JOIN cursos_novos USING (idCurso)
WHERE graduado=false
GROUP BY nomeCurso;

-- Apresentar a quantidade de estudantes ativos por disciplina.
SELECT nomeDisciplina, COUNT(*) AS quantidade 
FROM (matriculas NATURAL INNER JOIN estudantes) 
INNER JOIN disciplinas_novas USING (idDisciplina)
WHERE graduado=false
GROUP BY nomeDisciplina;
