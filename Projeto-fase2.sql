--CRIAÇÃO DA TABELA FUNCIONARIO
CREATE TABLE FUNCIONARIO (
	id_funcionario SERIAL NOT NULL,
	nome varchar(150) NOT NULL,
	cargo varchar(45) NOT NULL,
	email varchar(150) NOT NULL UNIQUE,
	CONSTRAINT PK_IDFUNC PRIMARY KEY (id_funcionario),
	CONSTRAINT CK_CARGO CHECK (cargo IN  ('Programador', 'Técnico', 'Gestão'))
);


--CRIAÇÃO DA TABELA CLIENTE
CREATE TABLE CLIENTE (
	id_cliente SERIAL NOT NULL,
	telefone VARCHAR(45),
	nome VARCHAR(150) NOT NULL,
	CONSTRAINT PK_CLIENTE PRIMARY KEY(id_cliente)
);

--CRIAÇÃO DA TABELA DE ENDEREÇOS
CREATE TABLE ENDERECO (
	id_cliente INTEGER NOT NULL,
	rua VARCHAR(70) NOT NULL,
	numero VARCHAR(10) NOT NULL DEFAULT 'S/N',
	complemento VARCHAR(45),
	bairro VARCHAR(45) NOT NULL,
	estado CHAR(2) NOT NULL DEFAULT 'PB',
	cidade VARCHAR(45) NOT NULL DEFAULT 'João Pessoa',
	CONSTRAINT PK_ENDERECO PRIMARY KEY (id_cliente),
	CONSTRAINT FK_CLIENTE FOREIGN KEY(id_cliente) REFERENCES CLIENTE
);


--CRIANDO A TABELA DE ATENDIMENTOS
CREATE TABLE ATENDIMENTO (
	id_atendimento SERIAL NOT NULL,
	url_relatorio VARCHAR(300) NOT NULL UNIQUE,
	data_atend DATE NOT NULL,
	id_func INTEGER NOT NULL,
	id_cli INTEGER NOT NULL,
	CONSTRAINT PK_ATEND PRIMARY KEY(id_atendimento),
	CONSTRAINT FK_FUNC FOREIGN KEY (id_func) REFERENCES FUNCIONARIO,
	CONSTRAINT FK_CLI FOREIGN KEY (id_cli) REFERENCES CLIENTE
);


--CRIAÇÃO DA TABELA DE SERVIÇOS
CREATE TABLE SERVICO(
	id_servico SERIAL NOT NULL,
	tipo VARCHAR(45) NOT NULL,
	CONSTRAINT PK_SERVICO PRIMARY KEY(id_servico)
);

--CRIAÇÃO DA TABELA ATENDIMENTO-SERVIÇO
CREATE TABLE ATENDSERVICO(
	id_servico INTEGER NOT NULL,
	id_atendimento INTEGER NOT NULL,
	CONSTRAINT FK_ATEND FOREIGN KEY(id_atendimento) REFERENCES ATENDIMENTO,
	CONSTRAINT FK_SERVICO FOREIGN KEY(id_servico) REFERENCES CLIENTE,
	CONSTRAINT PK_ATENDSERV PRIMARY KEY(id_atendimento, id_servico)
);

--Inserções de dados;

INSERT INTO FUNCIONARIO (NOME, CARGO, EMAIL) VALUES
('Gabryel Araújo', 'Programador', 'gabryel@email.com'),
('Filipe Rodrigues', 'Programador', 'filipe@email.com'),
('Pedro Santos', 'Programador', 'pedro.santos@email.com'),
('Mariana Oliveira', 'Programador', 'mariana.oliveira@email.com');

INSERT INTO FUNCIONARIO (NOME, CARGO, EMAIL) VALUES 
('Luís Mendes', 'Técnico', 'luis.mendes@email.com'),
('Carla Costa', 'Técnico', 'carla.costa@email.com'),
('Ricardo Fernandes', 'Técnico', 'ricardo.fernandes@email.com'),
('Sofia Almeida', 'Técnico', 'sofia.almeida@email.com');

INSERT INTO FUNCIONARIO (NOME, CARGO, EMAIL) VALUES 
('Carlos Santos', 'Gestão', 'carlos.santos@email.com'),
('Ana Silva', 'Gestão', 'ana.silva@email.com'),
('Paulo Oliveira', 'Gestão', 'paulo.oliveira@email.com'),
('Marta Costa', 'Gestão', 'marta.costa@email.com');

SELECT * FROM FUNCIONARIO;

--INSERÇÕES NA TABELA DE CLIENTE
INSERT INTO CLIENTE (telefone, nome) VALUES 
('987435462', 'Maria Silva'),
('999823466', 'João Santos'),
('987551254', 'Ana Oliveira'),
('987561234', 'Luís Pereira'),
('999762345', 'Sofia Fernandes'),
('999301255', 'Pedro Almeida'),
('997650087', 'Carla Costa'),
('991345589', 'Ricardo Mendes'),
('999335583', 'Mariana Santos'),
('991243567', 'Paulo Oliveira');

SELECT * FROM CLIENTE;

--INSERÇÕES NA TABELA DE ENDEREÇOS
--PRIMEIRA INSERÇÃO PARA TESTAR OS VALORES DEFAULT
INSERT INTO ENDERECO (id_cliente, rua, complemento, bairro)
VALUES (1,'Rua José da Silva','Apto 3001','Cabo Branco'),

--INSERT DO RESTANTE DOS ENDEREÇOS
INSERT INTO ENDERECO (id_cliente, rua, numero, complemento, bairro, estado, cidade) 
VALUES
(2, 'Rua Carlos Roberto Pires','104','Próximo ao campo', 'Bessa','PB','João Pessoa'),
(3, 'Rua Santa Catarina', '789', 'Próximo a pastelaria', 'Bessa', 'PB', 'João Pessoa'),
(4, 'Rua dos Girassóis', '321', 'Casa', 'Altiplano', 'PB', 'João Pessoa'),
(5, 'Avenida Senador Ruy Carneiro', '654', 'Ap. 202', 'Miramar', 'PB', 'João Pessoa'),
(6, 'Rua das Palmeiras', '111', 'Ap. 303', 'Tambaú', 'PB', 'João Pessoa'),
(7, 'Avenida Cabo Branco', '222', 'Casa', 'Cabo Branco', 'PB', 'João Pessoa'),
(8, 'Rua Manoel Gomes da Costa', '333', 'Casa', 'Alto do Mateus', 'PB', 'João Pessoa'),
(9, 'Rua Vinícius de Moraes', '444', 'Casa', 'Jardim Cidade Universitária', 'PB', 'João Pessoa'),
(10, 'Avenida Hilton Souto Maior', '555', 'Ap. 404', 'Mangabeira', 'PB', 'João Pessoa');

SELECT * FROM ENDERECO;

--INSERÇÃO DA TABELA DE ATENDIMENTOS
INSERT INTO ATENDIMENTO (url_relatorio, data_atend, id_func, id_cli) VALUES 
('http://example.com/relatorio1', '01/11/2023', 1, 1),
('http://example.com/relatorio2', '02/11/2023', 1, 2),
('http://example.com/relatorio3', '03/11/2023', 2, 3),
('http://example.com/relatorio4', '04/11/2023', 3, 4),
('http://example.com/relatorio5', '05/11/2023', 4, 5),
('http://example.com/relatorio6', '06/11/2023', 6, 6),
('http://example.com/relatorio7', '07/11/2023', 7, 7),
('http://example.com/relatorio8', '08/11/2023', 7, 8),
('http://example.com/relatorio9', '09/11/2023', 8, 9),
('http://example.com/relatorio10', '10/11/2023', 10, 10);

SELECT * FROM ATENDIMENTO;

--INSERÇÕES NA TABELA SERVIÇO
INSERT INTO SERVICO (tipo) VALUES 
('Programação'),
('Pré-Instalação'),
('Instalação'),
('Acompanhamento de Obra');

SELECT * FROM SERVICO;

--INSERÇÃO NA TABELA ATENDSERVICO
INSERT INTO ATENDSERVICO (id_servico, id_atendimento) VALUES
(1,1),
(1,2),
(1,3),
(2,4),
(2,5),
(2,6),
(3,7),
(3,8),
(3,9),
(3,10);

SELECT * FROM ATENDSERVICO;

--CONSULTAS

--1 consulta com uma tabela usando operadores básicos de filtro (e.g., IN, between, is null, etc).
SELECT NOME, CARGO FROM FUNCIONARIO
WHERE CARGO LIKE 'Programador';

--3 consultas com inner JOIN na cláusula FROM (pode ser self join, caso o domínio indique esse uso).

--CONSULTA QUE RETORNA PARA CADA FUNCIONARIO A DATA DOS SEUS ATENDIMENTOS E O LINK DOS SEUS RELATORIOS
SELECT F.NOME AS "Funcionário", A.DATA_ATEND, A.URL_RELATORIO
	FROM ATENDIMENTO A JOIN
	FUNCIONARIO F 
	ON A.ID_FUNC = F.ID_FUNCIONARIO;
--CONSULTA QUE RETORNE O NOME DO CLIENTE E O NOME DO FUNCIONARIO QUE O ATENDEU NO DIA 07-11-2023
SELECT C.NOME AS "CLIENTE", F.NOME AS "ATENDIDO POR"
	FROM ATENDIMENTO A JOIN
	CLIENTE C ON C.ID_CLIENTE = A.ID_CLI
	JOIN FUNCIONARIO F ON F.ID_FUNCIONARIO = A.ID_FUNC
	WHERE A.DATA_ATEND = '07/11/2023';
--CONSULTA QUE RETORNA O TIPO DE SERVIÇO QUE FOI REALIZADO NO ATENDIMENTO DO DIA 07-11-2023
SELECT S.TIPO
	FROM SERVICO S
	JOIN ATENDSERVICO ATS ON S.ID_SERVICO = ATS.ID_SERVICO
	JOIN ATENDIMENTO A ON ATS.ID_ATENDIMENTO= A.ID_ATENDIMENTO
	WHERE DATA_ATEND = '07/11/2023';
