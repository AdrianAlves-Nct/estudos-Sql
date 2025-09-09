-- Qual o valor total da receita gerada por consumidores de cada estado
-- considere a base completa com apenas pedidos entregues.
-- resolução antes da query:
-- tb_order_items - somar 'price'    
-- tb_sellers - seler_id(pk) - agrupar seller_city
-- tb_orders - order_id(pk) pegar o order_status 'delivered',
--   e tem customer_id(fk) para juntar com a tabela tb_customers e pegar o estado 'customer_state
SELECT t4.customer_state as cidade_consumidor,
    sum(t1.price) as receita,
    t3.order_status as status_venda
FROM tb_order_items as t1
LEFT JOIN tb_sellers as t2
    ON t1.seller_id = t2.seller_id
LEFT JOIN tb_orders as t3
    ON t1.order_id = t3.order_id
LEFT JOIN tb_customers as t4
    ON t3.customer_id = t4.customer_id
WHERE t3.order_status = 'delivered'
GROUP BY t4.customer_state
ORDER BY sum(t1.price) DESC

