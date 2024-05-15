--DDL

-- Criando a Tabela alunos

CREATE TABLE alunos(

	cpf varchar(17) primary key,
	nome varchar(50) NOT NULL,
	idade int,
	rua text,
	numero varchar(10),
	bairro varchar(20),
	cidade varchar(20),
	estado varchar(20),
	cep int,
	pais varchar(20)
)

ALTER TABLE alunos ALTER COLUMN cpf TYPE varchar(17) -- ALTERA A COLUNA CPF DA TABELA ALUNO MUDANDO O TIPO DA COLUNA PARA VARCHAR



CREATE TABLE telefones(  --NAO FOI CRIADO AINDA 
	cpf varchar(17) REFERENCES alunos,
	ddd int,
	numero int,
	cod_pais varchar(5)
)

drop table telefones

ALTER TABLE telefones ADD COLUMN cod_pais varchar(5) -- ADICIONA A COLUNA COD_PAIS NA TABELA COM TIPO VARCHAR E TAMANHO MAX DE 5 


CREATE TABLE emails(
	cpf varchar (17)REFERENCES alunos, 
	email varchar(30),
	dominio varchar(30)
)
ALTER TABLE emails ALTER COLUMN email TYPE varchar(64)



CREATE TABLE cursos(
	id_cursos serial primary key,
	id_departamento REFERENCES departamentos,
	nome_curso varchar(50)
)

ALTER TABLE cursos DROP COLUMN id_departamento -- EXCLUI A COLUNA POIS COLOQUEI ELA COMO SERIAL E PRECISEI INSERIR DADOS 

ALTER TABLE cursos ADD id_departamento int -- ADICIONEI NOVAMENTE A COLUNA id_departamento




CREATE TABLE matriculas(
	ra serial primary key,
	cpf varchar(17),
	status varchar(10),
	id_cursos int unique
)

DROP TABLE matriculas CASCADE


CREATE TABLE departamentos(
	id_departamento int primary key,
	sigla_departamento varchar(4),
	nome_departamento varchar(10)
)

DROP TABLE departamentos


INSERT INTO departamentos (id_departamento, sigla_departamento, nome_departamento) VALUES	
(1,'SUS','SAUDE'),
(2,'TECN','TECNOLOGIA'),
(3,'ENGE','ENGENHARIA'),
(4,'HUMA','HUMANAS');


CREATE TABLE curso_disciplina(
	id_disciplina serial references disciplinas,
	id_curso serial references cursos
)

CREATE TABLE disciplinas(
	id_disciplina serial primary key,
	nome_disciplina varchar(20),
	optativa varchar(20)
)


ALTER TABLE disciplinas RENAME COLUMN id_disciplina TO id_disciplina -- Esse comando altera o nome da coluna para tal nome
-- porém a minha tabela ja está com o nome certo entao nao vou usar 



CREATE TABLE matricula_disciplina(
	ra int ,
	id_disciplina int
)
drop table matricula_disciplina



-- A PARTIR DAQUI É DML

--JA INSERI OS DADOS NAS TABELAS ALUNOS - CURSOS - DEPARTAMENTOS - DISCIPLINAS

-- INSERE DADOS NA TABELA ALUNOS
INSERT INTO alunos (cpf, nome, idade, rua, numero, bairro, cidade, estado, cep, pais) VALUES
('111.222.333-44', 'Ana Silva', 25, 'Rua das Flores', '123', 'Centro', 'São Paulo', 'SP', 01001, 'Brasil'),
('222.333.444-55', 'Carlos Oliveira', 30, 'Avenida Paulista', '456', 'Jardins', 'Rio de Janeiro', 'RJ', 20000, 'Brasil'),
('333.444.555-66', 'Mariana Souza', 22, 'Rua das Palmeiras', '789', 'Barra Funda', 'São Paulo', 'SP', 02002, 'Brasil'),
('444.555.666-77', 'Lucas Santos', 28, 'Rua dos Ipês', '321', 'Ipanema', 'Rio de Janeiro', 'RJ', 21000, 'Brasil'),
('555.666.777-88', 'Patrícia Costa', 23, 'Avenida dos Bandeirantes', '654', 'Jardim Paulista', 'São Paulo', 'SP', 03003, 'Brasil'),
('666.777.888-99', 'Fernanda Pereira', 27, 'Rua das Acácias', '987', 'Leblon', 'Rio de Janeiro', 'RJ', 22000, 'Brasil'),
('777.888.999-00', 'Gabriel Lima', 24, 'Avenida Brasil', '101', 'Copacabana', 'Rio de Janeiro', 'RJ', 23000, 'Brasil'),
('888.999.000-11', 'Isabela Almeida', 26, 'Rua das Margaridas', '111', 'Botafogo', 'Rio de Janeiro', 'RJ', 24000, 'Brasil'),
('999.000.111-22', 'Rafaela Martins', 29, 'Avenida Atlântica', '222', 'Icaraí', 'Niterói', 'RJ', 25000, 'Brasil'),
('000.111.222-33', 'Gustavo Ferreira', 21, 'Rua da Praia', '333', 'Camboinhas', 'Niterói', 'RJ', 26000, 'Brasil');


-- INSERE DADOS NA TABELA CURSOS

ALTER TABLE cursos ALTER COLUMN nome_curso TYPE varchar(50)

INSERT INTO cursos (nome_curso) VALUES
('Medicina'),
('Enfermagem'),
('Nutrição'),
('Ciência da Computação'),
('Engenharia de Software'),
('Inteligência Artificial'),
('Engenharia Civil'),
('Engenharia Elétrica'),
('Engenharia Mecânica'),
('Psicologia'),
('História'),
('Sociologia');

INSERT INTO departamentos (sigla_departamento, nome_departamento) VALUES
('IT', 'Tec da Inf'),
('HR', 'RecHuman'),
('MK', 'Marketing'),
('SLS', 'Vendas'),
('FIN', 'Finanças'),
('ENG', 'Engenharia'),
('PRD', 'Produção'),
('QA', 'ContQual'),
('OP', 'Operações'),
('ADM', 'Administr');


INSERT INTO disciplinas (nome_disciplina, optativa) VALUES
('Matemática', 'Não'),
('História', 'Não'),
('Geografia', 'Não'),
('Biologia', 'Sim'),
('Física', 'Não'),
('Química', 'Não'),
('Educação Física', 'Sim'),
('Artes', 'Sim'),
('Inglês', 'Não'),
('Programação', 'Sim');

INSERT INTO telefones (cpf, ddd, numero, cod_pais) VALUES 
('111.222.333-44', 11, 987654321, 55),
('222.333.444-55', 21, 876543210, 33),
('333.444.555-66', 31, 765432109, 49),
('444.555.666-77', 41, 654321098, 1),
('555.666.777-88', 51, 543210987, 86),
('666.777.888-99', 61, 432109876, 44),
('777.888.999-00', 71, 321098765, 81),
('888.999.000-11', 81, 210987654, 39),
('999.000.111-22', 91, 109876543, 7),
('000.111.222-33', 92, 098765432, 52);

INSERT INTO emails (cpf, email, dominio) VALUES
('111.222.333-44', 'fulano@gmail.com', 'gmail.com'),
('222.333.444-55', 'ciclano@yahoo.com', 'yahoo.com'),
('333.444.555-66', 'beltrano@hotmail.com', 'hotmail.com'),
('444.555.666-77', 'joao@empresa.com', 'empresa.com'),
('555.666.777-88', 'maria@outlook.com', 'outlook.com'),
('666.777.888-99', 'ana@universidade.edu', 'universidade.edu'),
('777.888.999-00', 'carlos@startup.io', 'startup.io'),
('888.999.000-11', 'laura@consultoria.net', 'consultoria.net'),
('999.000.111-22', 'pedro@agencia.org', 'agencia.org'),
('000.111.222-33', 'beatriz@engenharia.com', 'engenharia.com');

INSERT INTO curso_disciplina (id_curso, id_disciplina)VALUES
(73,1),
(74,2),
(75,3),
(76,4),
(77,5),
(78,6),
(79,7),
(80,8),
(81,9),
(82,10)

INSERT INTO matriculas (cpf, status, id_cursos) VALUES
('111.222.333-44', 'Ativa',73),
('222.333.444-55', 'Inativa',74),
('333.444.555-66', 'Ativa',75),
('444.555.666-77', 'Ativa',76),
('555.666.777-88', 'Inativa',77),
('666.777.888-99', 'Ativa',78),
('777.888.999-00', 'Ativa',79),
('888.999.000-11', 'Inativa',80),
('999.000.111-22', 'Ativa',81),
('000.111.222-33', 'Ativa',82);

INSERT INTO matricula_disciplina(ra,id_disciplina) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10)


 -- MOSTRA OS DADOS DA TABELA TELEFONE

SELECT * FROM telefones
SELECT * FROM departamentos -- VER OS DADOS QUE FORAM INSERIDOS EM DEPARTAMENTO
SELECT * FROM matricula_disciplina
SELECT * FROM cursos  -- VER OS DADOS QUE FORAM INSERIDOS EM CURSOS
SELECT * FROM alunos
SELECT * FROM curso_disciplina
SELECT * FROM emails
SELECT * FROM matriculas
SELECT * FROM disciplinas







-- COMANDOS DE PESQUISA -- 

--Dado o RA ou o Nome do Aluno, buscar no BD todos os demais dados do aluno.

SELECT * FROM alunos WHERE ra = '1' OR nome = 'Ana Silva';
