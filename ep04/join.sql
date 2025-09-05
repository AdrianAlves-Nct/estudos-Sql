-- sintaxe: 
/*selecione tudo da tabela 1 e algumas colunas da 2
vindo tabela 1
juntar pela esquerda com essa tabela 2
onde coluna da FK 1 for igual a essa coluna da PK 2*/
SELECT t1.*, t2.product_category_name 
FROM tb_order_items as t1
LEFT JOIN tb_products as t2
ON t1.product_id = t2.product_id


-- Qual o top 10 receita de cada categoria de produto?
SELECT t1.*, t2.product_category_name, sum(t1.price) as receita
FROM tb_order_items as t1
LEFT JOIN tb_products as t2
ON t1.product_id = t2.product_id
GROUP by t2.product_category_name
ORDER BY  sum(t1.price) DESC
LIMIT 10
-- e o total de vendas em Unidades e em unidades e pedidos.