-- Como faço para pegar valores da tabela? Vamos pegar o maior, menor e a média.
SELECT max(product_weight_g) as maior_peso,
        min(product_weight_g) as menor_peso,
        avg(product_weight_g) as media_peso
FROM tb_products

-- Agora faça maior, menor e média para categoria de artes
SELECT max(product_weight_g) as maior_peso,
        min(product_weight_g) as menor_peso,
        avg(product_weight_g) as media_peso
FROM tb_products
WHERE product_category_name = 'artes'

-- Para simplificar a analise, é mais fácil pegar um resumo estatístico de todas as tabelas, para isso, group by

SELECT product_category_name,
        max(product_weight_g) as maior_peso,
        min(product_weight_g) as menor_peso,
        avg(product_weight_g) as media_peso,
        count(*) as qtd_produto
FROM tb_products
WHERE product_category_name IS NOT NULL
GROUP BY product_category_name