/*FILTRO MAIOR IGUAL MENOS DIFERENTE*/
SELECT * FROM tbCliente
WHERE IDADE >= 24;

SELECT * FROM tbCliente
WHERE IDADE <> 24;

SELECT * FROM tbCliente 
WHERE DATA_NASCIMENTO > '1985-01-13';

SELECT * FROM tbCliente 
WHERE YEAR(DATA_NASCIMENTO) = 1995;

/*FILTROS COMPOSTOS*/
SELECT * FROM tbProduto
WHERE sabor = 'melancia' and preco_lista > 5.00;