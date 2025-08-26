-- Having usa os campos agregados para fazer as manipulações, filtrar etc. 

SELECT seller_state,
            count(*) as qtd_vendedores
FROM tb_sellers
GROUP BY seller_state
HAVING  count(*) > 10 