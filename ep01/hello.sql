/*Objetivo: Estamos usando um banco de dados criado, com o objetivo que aprender a fazer consultas e manupulações com dados. O curso é mais voltado a isso!

Porque estudar sql? Sql, ou Linguagem de Consulta Estruturada, serve para fazer consultas em banco de dados. 
Onde fazemos as consultas? Nos SGBDs, que gerenciam os bancos de dados e é onde o banco de dados é criado e armazenado os valores atravéz dos sistemas.

No nosso DATABASE tem 8 tabelas, sendo elas:
tb_order_reviews: onde estão registros de reviews
tb_orders: onde estão registros de pedidos
tb_order_items: um pedido pode ter vários items, e é aqui que eles ficam
tb_sellers: quem vendeu
tb_geolocation: localização
tb_customers: informações de quem comprou
tb_products: informações sobre os produtos
tb_order_payments: informações sobre o tipo de pagamento


As consultas são feitas com Operações:

-- Selecionar tudo de uma tabela
SELECT *
FROM tb_sellers


-- Selecionar algumas colunas de uma tabela
SELECT seller_id, seller_state 
FROM tb_sellers

SELECT  product_id, product_category_name, product_photos_qty 
FROM tb_products

-- Selecionar aplicando Filtros, Ex.: Buscar apenas os produtos da categoria "bebes"
SELECT product_id, product_category_name, product_photos_qty 
FROM tb_products
WHERE (product_category_name = 'bebes'

-- Selecionar com mais de um critério usamos o parênteses, pois o and tem prioridade, se quisermos fazer um OU outro, tem que ser em parênteses: Ex.: Selecionar os produtos de bebes Ou de perfumaria e fotos mais de 1
SELECT product_id, product_category_name, product_photos_qty 
FROM tb_products
WHERE (product_category_name = 'bebes' 
    OR product_category_name = 'perfumaria') 
AND product_photos_qty > 1*/

-- bebes acima de 1 foto ou perfumaria acima de 5 fotos
SELECT product_id, product_category_name, product_photos_qty
FROM tb_products
WHERE (product_category_name = 'bebes' AND product_photos_qty > 1) 
OR (product_category_name = 'perfumaria' AND product_photos_qty > 5)