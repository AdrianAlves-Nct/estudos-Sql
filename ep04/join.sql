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
SELECT t2.product_category_name, 
        sum(t1.price) as receita
FROM tb_order_items as t1
LEFT JOIN tb_products as t2
ON t1.product_id = t2.product_id
GROUP by t2.product_category_name
ORDER BY  sum(t1.price) DESC
LIMIT 10
-- e o total de vendas em Unidades e em quantidade de pedidos.
SELECT t2.product_category_name, 
        sum(t1.price) as receita,  
        count(*) as total_vendidos, 
        count(DISTINCT t1.order_id) as qtd_pedidos
FROM tb_order_items as t1
LEFT JOIN tb_products as t2
ON t1.product_id = t2.product_id
GROUP by t2.product_category_name
ORDER BY  count(*) DESC


-- e considerando as vendas de 2017 e pedidos entregues
SELECT t2.product_category_name, 
        sum(t1.price) as receita,  
        count(*) as total_vendidos, 
        count(DISTINCT t1.order_id) as qtd_pedidos,
        t3.order_approved_at as data_aprovacao_pedido, 
        t3.order_status as status_venda
FROM tb_order_items as t1
LEFT JOIN tb_products as t2
ON t1.product_id = t2.product_id
LEFT JOIN tb_orders as t3
ON t1.order_id = t3.order_id
WHERE t3.order_approved_at LIKE "%2017%" AND t3.order_status = 'delivered'
GROUP by t2.product_category_name
ORDER BY count(*)  DESC



