-- Qual o valor total de receita gerada por sellers de cada estado?
-- Considere a base completa com os pedidos entregues. 
-- Resolução, contar o total de selleres e dividir por total de receita, agrupando por estado
-- enquanto os pedidos foram entregues
SELECT t2.seller_state,
        sum(t1.price) as total_receita,
        sum(t1.price) / count( DISTINCT t2.seller_id) as avg_seller_receita_state,
         count( DISTINCT t2.seller_id) as sellers_state
FROM tb_order_items as t1

LEFT JOIN tb_sellers as t2
ON t1.seller_id = t2.seller_id

LEFT JOIN tb_orders as t3
ON t1.order_id = t3.order_id

WHERE t3.order_status = 'delivered'

GROUP BY t2.seller_state

ORDER BY sum(t1.price) / count( DISTINCT t2.seller_id) DESC