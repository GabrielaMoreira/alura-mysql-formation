/* FUNÇÃO */

/* caso de erro ao criar função, executar comando*/
SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER //
CREATE FUNCTION `FUNC_ACHA_SABOR` (VSABOR VARCHAR(50))
RETURNS VARCHAR(20)
BEGIN
	DECLARE VRETORNO VARCHAR(20) DEFAULT 'NAO ENCONTRADO';
    
    CASE VSABOR
		WHEN 'Lima/Limão' THEN SET VRETORNO = 'Citrico';
        WHEN 'Laranja' THEN SET VRETORNO = 'Citrico';
        WHEN 'Morango/Limão' THEN SET VRETORNO = 'Citrico';
        WHEN 'Uva' THEN SET VRETORNO = 'Neutro';
        WHEN 'Morango' THEN SET VRETORNO = 'Neutro';
        ELSE SET VRETORNO = 'Acido';
    END CASE;
    
RETURN VRETORNO;
END //

SELECT FUNC_ACHA_SABOR('Laranja');
SELECT NOME_DO_PRODUTO, SABOR, FUNC_ACHA_SABOR(SABOR) AS TIPO FROM TABELA_DE_PRODUTOS;