-- Qual o produto de mais vendido que cada seller vendeu, considere os entregues

-- Como fazer uma consulta onde uma linha o seller e o produto que ele mais vendeu?

SELECT DISTINCT t1.seller_id,
        t1.product_id,
        count(t1.product_id)as qtd_produtos,
        sum(t1.price) as receita_produto
FROM tb_order_items as t1


LEFT JOIN tb_orders as t4
ON t1.order_id = t4.order_id

WHERE t4.order_status = 'delivered'

GROUP BY t1.seller_id, t1.product_id

ORDER BY t1.seller_id

-- fica pra próxima aula como resolver esse puzze!