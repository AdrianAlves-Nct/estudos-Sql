-- pegue a receita por estado, por produto da categoria mais vendida


SELECT  t2.seller_state,
        t1.product_id,
        t3.product_category_name,
        sum(t1.price)
       
FROM tb_order_items as t1
LEFT JOIN tb_sellers as t2
On t1.seller_id = t2.seller_id
LEFT JOIN tb_products as t3
ON t1.product_id = t3.product_id

WHERE product_category_name = 'cama_mesa_banho' 

GROUP BY t2.seller_state,
        t1.product_id,
        t3.product_category_name;
-- até agora fizemos o agrupamento por produto e por cidade, mas como pegar a categoria mais vendida?
-- vamos descobrir a categoria de produto que mais vende: decobrimos que é a categoria cama_mesa_banho

SELECT t2.product_category_name
FROM tb_order_items as t1
LEFT JOIN tb_products as t2
On t1.product_id = t2.product_id
WHERE product_category_name is not null
GROUP BY  t2.product_category_name
order BY  count(*) DESC
LIMIT 1;
-- Bom... isso funcionou, mas tivemos que fazer uma query separada para descobrir a categoria. Esse problema pode ser resolvido com subquery, que basicamente usa o resultado de uma query para fazer uma nova consulta.
-- Note que pegamos o resultado da query e adicionamos no Where, lógicamente vamos colocar a query toda no where, ficando mais dinâmico, dessa forma:

SELECT  t2.seller_state,
        t1.product_id,
        t3.product_category_name,
        sum(t1.price)
       
FROM tb_order_items as t1
LEFT JOIN tb_sellers as t2
On t1.seller_id = t2.seller_id
LEFT JOIN tb_products as t3
ON t1.product_id = t3.product_id

WHERE product_category_name = 
/*Nota, o operador de igualdade(=) foi empregado porque estamos retornando 1 valor apenas, "limit 1", se estivermos retornando mais de um valor, é usado o "IN"*/
(
    SELECT t2.product_category_name
    FROM tb_order_items as t1
    LEFT JOIN tb_products as t2
    On t1.product_id = t2.product_id
    WHERE product_category_name is not null
    GROUP BY  t2.product_category_name
    order BY  count(*) DESC
    LIMIT 1
)

GROUP BY t2.seller_state,
        t1.product_id,
        t3.product_category_name;