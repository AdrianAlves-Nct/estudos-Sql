-- Qual o peso médio dos produtos vendidos por sellers de cada estado?
-- Considere apenas o ano de 2017 e pedidos entregues nesta análise. 
-- Para resolver um problema, vamos dividir e conquistar...
-- Resolução:
-- peso médio produtos: tb_products > product_weight_g > média
-- Sellers > estado: tb_sellers > seller_state
-- Ano 2017: tb_orders > order_approved_at
-- pedidos entregues: tb_orders > order_status

-- Por onde fazer os joins?
-- tb_order_items puxa tb_products(product_id), tb_sellers(seller_id) e tb_orders(order_id)

SELECT t3.seller_state,
        sum(t2.product_weight_g) as total_peso_produto,
        avg(t2.product_weight_g)  as avg_peso_produto
FROM tb_order_items as t1
LEFT JOIN tb_products as t2
    ON t1.product_id = t2.product_id
LEFT JOIN tb_sellers as t3
    ON t1.seller_id = t3.seller_id
LEFT JOIN tb_orders as t4
    ON t1.order_id = t4.order_id
WHERE t4.order_approved_at LIKE "%2017%" and t4.order_status  = 'delivered'
GROUP BY t3.seller_state 