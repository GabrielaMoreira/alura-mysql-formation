/* DO WHILE */
CREATE TABLE TAB_LOOP(ID INT); 

DELIMITER //
CREATE PROCEDURE `LOOP_WHILE` (VINICIAL INT, VFINAL INT)
BEGIN
	DECLARE CONTADOR INT;
    DELETE FROM TAB_LOOP;
    
    SET CONTADOR = VINICIAL;
	WHILE CONTADOR <= VFINAL
		DO
			INSERT INTO TAB_LOOP(ID)
            VALUES(CONTADOR);
			SET CONTADOR = CONTADOR + 1;
		END WHILE;
        
	SELECT * FROM TAB_LOOP;

END //

CALL LOOP_WHILE(1,10);