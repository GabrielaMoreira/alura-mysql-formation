CREATE DATABASE vendas_sucos;

CREATE TABLE tbProdutos(
	CODIGO VARCHAR(10) NOT NULL AUTO_INCREMENT,
    DESCRITOR VARCHAR(100) NULL,
    SABOR VARCHAR(50) NULL,
    TAMANHO VARCHAR(50) NULL,
	EMBALAGEM VARCHAR(50) NULL,
    PRECO_LISTA FLOAT NULL,
    
    PRIMARY KEY (CODIGO)

);

CREATE TABLE tbVendedores(
	MATRICULA VARCHAR(5) NOT NULL,
    NOME VARCHAR(100) NULL,
    BAIRRO VARCHAR(50) NULL,
    COMISSAO FLOAT NULL,
    DATA_ADMISSAO DATE NULL,
    FERIAS BIT(1),

	PRIMARY KEY(MATRICULA)

);

CREATE TABLE tbCliente(
	CPF VARCHAR(11) NOT NULL,
    NOME VARCHAR(100) NULL,
    ENDERECO VARCHAR(150) NULL,
    BAIRRO VARCHAR(50) NULL,
    CIDADE VARCHAR(50) NULL,
    ESTADO VARCHAR(50) NULL,
    CEP VARCHAR(8) NULL,
    DATA_NASCIMENTO DATE NULL,
    IDADE INT NULL,
    SEXO VARCHAR(1) NULL,
    LIMITE_CREDITO FLOAT NULL,
    VOLUME_COMPRA FLOAT NULL,
    PRIMEIRA_COMPRA BIT(1),

	PRIMARY KEY(CPF)

);

CREATE TABLE tbVendas(
	NUMERO VARCHAR(5) NOT NULL,
    DATA DATE NULL,
    CPF VARCHAR(11) NOT NULL,
    MATRICULA VARCHAR(5) NOT NULL,
    IMPOSTO FLOAT,

	PRIMARY KEY(NUMERO),
    CONSTRAINT
    FK_CLIENTE FOREIGN KEY(CPF) REFERENCES tbCliente(CPF),
    CONSTRAINT
    FK_VENDEDOR FOREIGN KEY(MATRICULA) REFERENCES tbVendedores(MATRICULA)
    
);

CREATE TABLE tbItensVendidos(
	NUMERO VARCHAR(5) NOT NULL,
    CODIGO_PRODUTO VARCHAR(10) NOT NULL,
    QUANTIDADE INT NULL,
    PRECO FLOAT NULL,

	PRIMARY KEY (NUMERO, CODIGO_PRODUTO),
    CONSTRAINT
    PFK_NUMERO FOREIGN KEY (NUMERO) REFERENCES tbVendas(NUMERO),
    CONSTRAINT
    FK_PRODUTO FOREIGN KEY (CODIGO_PRODUTO) REFERENCES tbProdutos(CODIGO)

);


INSERT INTO tbCliente
(CPF,NOME,ENDERECO,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA)
VALUES 
('1471156710','Érica Carvalho','R. Iriquitia','Jardins','São Paulo','SP','80012212','19900901',27,'F',170000,24500,0),
('19290992743','Fernando Cavalcante','R. Dois de Fevereiro','Água Santa','Rio de Janeiro','RJ','22000000','20000212',18,'M',100000,20000,1),
('2600586709','César Teixeira','Rua Conde de Bonfim','Tijuca','Rio de Janeiro','RJ','22020001','20000312',18,'M',120000,22000,0);

/* IMPORTE DE DADOS DE OUTRO BANCO */
USE VENDAS_SUCOS;

SELECT
	CODIGO_DO_PRODUTO AS CODIGO,
    NOME_DO_PRODUTO AS DESCRITOR,
    EMBALAGEM,
    TAMANHO,
    SABOR,
    PRECO_DE_LISTA AS PRECO_LISTA
FROM SUCOS_VENDAS.TABELA_DE_PRODUTOS
WHERE CODIGO_DO_PRODUTO NOT IN (SELECT CODIGO FROM TBPRODUTOS);

INSERT INTO TBPRODUTOS
SELECT
	CODIGO_DO_PRODUTO AS CODIGO,
    NOME_DO_PRODUTO AS DESCRITOR,
    SABOR,    
    TAMANHO,
    EMBALAGEM,
    PRECO_DE_LISTA AS PRECO_LISTA
FROM SUCOS_VENDAS.TABELA_DE_PRODUTOS
WHERE CODIGO_DO_PRODUTO NOT IN (SELECT CODIGO FROM TBPRODUTOS);

SELECT * FROM tbprodutos;
SELECT * FROM TBCLIENTE;

INSERT INTO TBCLIENTE
SELECT
	CPF,
    NOME,
    ENDERECO_1 AS ENDERECO,
    BAIRRO,
    CIDADE,
    ESTADO,
    CEP,
    DATA_DE_NASCIMENTO AS DATA_NASCIMENTO,
    IDADE,
    SEXO,
    LIMITE_DE_CREDITO AS LIMITE_CREDITO,
    VOLUME_DE_COMPRA AS VOLUME_COMPRA,
    PRIMEIRA_COMPRA
FROM SUCOS_VENDAS.TABELA_DE_CLIENTES
WHERE CPF NOT IN (SELECT CPF FROM TBCLIENTE);


/* AUTO-INCREMENTO */

