/* COMMIT - ROLLBACK - START TRANSACTION*/
START TRANSACTION;

SELECT * FROM tabela_de_vendedores;
UPDATE TABELA_DE_VENDEDORES
SET PERCENTUAL_COMISSAO = PERCENTUAL_COMISSAO * 1.10;
ROLLBACK;

COMMIT;