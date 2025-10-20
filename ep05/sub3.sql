--  Uma boa prática é usar o WITH, para consultas mais complexas, é mais fácil de dar manutenção e tem uma melhor legibilidade.

WITH tb_best_categoria as (
    SELECT t2.product_category_name
    FROM tb_order_items as t1
    LEFT JOIN tb_products as t2
    On t1.product_id = t2.product_id
    GROUP BY  t2.product_category_name
    order BY  count(*) DESC
    LIMIT 1
), 

tb_receita_estado_produto as (
    SELECT  t2.seller_state,
        t1.product_id,
        t3.product_category_name,
        sum(t1.price)
       
    FROM tb_order_items as t1

    LEFT JOIN tb_sellers as t2
    On t1.seller_id = t2.seller_id

    LEFT JOIN tb_products as t3
    ON t1.product_id = t3.product_id

    GROUP BY t2.seller_state,
        t1.product_id,
        t3.product_category_name
)


SELECT * 
FROM tb_receita_estado_produto as t1
INNER JOIN tb_best_categoria as t2
ON t1.product_category_name = t2.product_category_name
