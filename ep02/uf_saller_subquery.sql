-- Quantos vendedores há para os estados de RJ, SP e PR?

SELECT seller_state,
        count(*) as qtd_vendedores
FROM tb_sellers
WHERE 
-- seller_state = 'SP' OR seller_state = 'RJ' OR seller_state = 'PR'. Melhor usar o IN
seller_state in ('SP', 'RJ', 'PR')
GROUP BY seller_state 

-- Traga os estados com a quantidade de vendedores acima de 10.
-- Para isso vamos fazer uma consulta no resultado do group by.
SELECT *
FROM (
    SELECT seller_state,
            count(*) as qtd_vendedores
    FROM tb_sellers
    GROUP BY seller_state
    )
WHERE qtd_vendedores > 10
--Por que isso? Porque o where sempre vem antes do group by, e para filtrar a tabela, primeiro temos que ter ela agrupada para filtrar. Então é, AGRUPAR > SELECIONAR > FILTRAR.
-- O nome disso é SUBQUERY, é considerada seu uso em momentos específicos quando não tem outra alternativa, vamos tentar minimizar subquery sempre que possível. No caso usamos o HAVING!