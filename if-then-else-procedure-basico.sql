/* IF THEN ELSE */
DELIMITER //
CREATE PROCEDURE `PROC_CLIENTE_NOVO` (VCPF VARCHAR(20))
BEGIN
	DECLARE VRESULTADO VARCHAR(20);
    DECLARE VDATA_NASCIMENTO DATE;
    SELECT DATA_DE_nASCIMENTO INTO VDATA_NASCIMENTO
    FROM TABELA_DE_CLIENTES WHERE CPF = VCPF;

	IF VDATA_NASCIMENTO < '20000101'
    THEN
		SET VRESULTADO = 'CLIENTE VELHO';
    ELSE
		SET VRESULTADO = 'CLIENTE NOVO';
    END IF;
	
    SELECT VRESULTADO;
    
END //

CALL PROC_CLIENTE_NOVO('1471156710');

