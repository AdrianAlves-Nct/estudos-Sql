-- Vamos ver outra forma de fazer subquery para obter o mesmo resultado. 
SELECT t2.product_category_name
FROM tb_order_items as t1
LEFT JOIN tb_products as t2
On t1.product_id = t2.product_id
WHERE product_category_name is not null
GROUP BY  t2.product_category_name
order BY  count(*) DESC
LIMIT 3;
-- Partindo do princípio que toda query gera uma tabela, podemos usar essa tabela para fazer novos joins.

SELECT  t2.seller_state,
        t1.product_id,
        t3.product_category_name,
        sum(t1.price)
FROM tb_order_items as t1
LEFT JOIN tb_sellers as t2
On t1.seller_id = t2.seller_id
LEFT JOIN tb_products as t3
ON t1.product_id = t3.product_id

/*Inner join para trazer apenas as informações que estiverem nas duas tabelas, poderia ser right tbm, mas o sqlite nao suporta*/
INNER JOIN (
    SELECT t2.product_category_name, 
    FROM tb_order_items as t1
    LEFT JOIN tb_products as t2
    On t1.product_id = t2.product_id
    WHERE product_category_name is not null
    GROUP BY  t2.product_category_name
    order BY  count(*) DESC
    LIMIT 1
) as t4
ON t3.product_category_name = t4.product_category_name 
/*Onde a tabela de produto, na coluna das categorias seja igual ao resultado da nossa opeeação que trouxe a categoria mais vendida*/

GROUP BY t2.seller_state,
        t1.product_id,
        t3.product_category_name;