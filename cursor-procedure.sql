/* DEFINICAO DE CURSOR */
DELIMITER //
CREATE PROCEDURE `PROC_CURSOR` ()
BEGIN
	DECLARE VNOME VARCHAR(50);
    DECLARE VCURSOR CURSOR FOR SELECT NOME FROM tabela_de_clientes LIMIT 4;
	OPEN VCURSOR;
		/*PRIMEIRA POSICAO*/
		FETCH VCURSOR INTO VNOME;
		SELECT VNOME;
		/*SEGUNDA POSICAO*/
		FETCH VCURSOR INTO VNOME;
		SELECT VNOME;
		/*TERCEIRA POSICAO*/
		FETCH VCURSOR INTO VNOME;
		SELECT VNOME;
		/*QUARTA POSICAO*/
		FETCH VCURSOR INTO VNOME;
		SELECT VNOME;
    CLOSE VCURSOR;
END //

CALL PROC_CURSOR;

/* CURSOR DINAMICO */
DELIMITER //
CREATE PROCEDURE `PROC_CURSOR_LOOP` ()
BEGIN
	DECLARE VFIM INT DEFAULT 0;
	DECLARE VNOME VARCHAR(50);
    DECLARE VCURSOR CURSOR FOR SELECT NOME FROM tabela_de_clientes LIMIT 4;    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET VFIM = 1;
    
	OPEN VCURSOR;
    WHILE VFIM = 0
    DO
		FETCH VCURSOR INTO VNOME;
		IF VFIM = 0 THEN			
			SELECT VNOME;
		END IF;
    END WHILE;		
    CLOSE VCURSOR;
    
END //

CALL PROC_CURSOR_LOOP;

/* ACESSANDO MAIS DE UM CAMPO */
DELIMITER //
CREATE PROCEDURE `LOOP_CURSOR_MULTIPLO` ()
BEGIN
	DECLARE VFIM INT DEFAULT 0;
    DECLARE VCIDADE, VESTADO, VCEP VARCHAR(50);
    DECLARE VNOME, VENDERECO VARCHAR(150);
    
	DECLARE VCURSOR CURSOR FOR
    SELECT NOME, ENDERECO_1, CIDADE, ESTADO, CEP FROM tabela_de_clientes LIMIT 3;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET VFIM = 1;
    
    OPEN VCURSOR;
    WHILE VFIM = 0
    DO
		FETCH VCURSOR INTO VNOME, VENDERECO, VCIDADE, VESTADO, VCEP;
        IF VFIM = 0 THEN
			SELECT CONCAT(VNOME, ',', VENDERECO, ',', VCIDADE, '-', VESTADO, '-', VCEP) AS RESULTADO;
		END IF;
    END WHILE;
    CLOSE VCURSOR;
    
END //

CALL LOOP_CURSOR_MULTIPLO;