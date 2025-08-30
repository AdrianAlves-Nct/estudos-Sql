-- Ex2. Faça uma query que apresente o tamanho médio, máximo e mínimo do nome do objeto por categoria
SELECT product_category_name as categoria_produto,
        avg(product_name_lenght) as media_nome_produto,
        max(product_name_lenght) as maior_nome_produto,
        min(product_name_lenght) as menor_nome_produto
FROM tb_products
GROUP BY product_category_name 
HAVING product_category_name NOT NULL