/* PROCEDURE */

DELIMITER $$
CREATE PROCEDURE `ALO_MUNDO` ()
BEGIN
	SELECT 'ALO MUNDO';
END$$

CALL ALO_MUNDO;

/* DELCARAR VARIAVEIS */
DELIMITER //
CREATE PROCEDURE `EXIBE_VARIAVEL`()
BEGIN
	DECLARE TEXTO CHAR(20) DEFAULT 'ALO MUNDO';
    SELECT TEXTO;
END//

CALL EXIBE_VARIAVEL;

DELIMITER //
CREATE DEFINER = `root`@`localhost` PROCEDURE `DATA` ()
BEGIN
	DECLARE DATA_1, DATA_2 DATE DEFAULT '201-09-13';
	SELECT DATA_1, DATA_2;
END //

CALL DATA

DELIMITER //
CREATE PROCEDURE `PROC_TESTE`()

BEGIN

DECLARE Cliente VARCHAR(10);
DECLARE Idade INT;
DECLARE DataNascimento DATE;
DECLARE Custo FLOAT;

SET Cliente = 'João';
SET Idade = 10;
SET DataNascimento = '20170110';
SET Custo = 10.23;

SELECT Cliente, Idade, DataNascimento, Custo;

END //

CALL PROC_TESTE;

/* PROCEDURE INCLUI NOVO PRODUTO */
DELIMITER //
CREATE PROCEDURE `INSERE_PRODUTO`()
BEGIN
	DECLARE VCODIGO VARCHAR(50) DEFAULT 'TESTE';
    DECLARE VNOME VARCHAR(50) DEFAULT 'TESTE';
    DECLARE VSABOR VARCHAR(50) DEFAULT 'TESTE';
    DECLARE VTAMANHO VARCHAR(50) DEFAULT 'TESTE';
    DECLARE VEMBALAGEM VARCHAR(50) DEFAULT 'TESTE';
    DECLARE VPRECO DECIMAL DEFAULT 0;

	INSERT INTO tabela_de_produtos
    VALUES(VCODIGO, VNOME, VSABOR, VTAMANHO, VEMBALAGEM, VPRECO);
END //

CALL INSERE_PRODUTO;

SELECT * FROM TABELA_DE_PRODUTOS;


/* PROCEDURE COM PARAMENTRO - INCLUIR PARAMETRO*/
DELIMITER //
CREATE PROCEDURE `INSERE_PRODUTO_PAR`(
		VCODIGO VARCHAR(50), 
		VNOME VARCHAR(50), 
        VSABOR VARCHAR(50), 
        VTAMANHO VARCHAR(50), 
        VEMBALAGEM VARCHAR(50), 
        VPRECO DECIMAL)
BEGIN	
	INSERT INTO tabela_de_produtos
    VALUES(VCODIGO, VNOME, VSABOR, VTAMANHO, VEMBALAGEM, VPRECO);
END //


CALL INSERE_PRODUTO_PAR('TESTE2', 'TESTE2', 'TESTE2', 'TESTE2', 'TESTE2', 1);

SELECT * FROM TABELA_DE_PRODUTOS;





