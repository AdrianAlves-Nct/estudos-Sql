-- Ex1. Faça uma query que apresente o tamanho médio, máximo e mínimo da descrição do objeto por categoria
SELECT product_category_name,
        avg(product_description_lenght) as avg_lenght_description,
        max(product_description_lenght) as max_lenght_description,
        min(product_description_lenght) as min_lenght_description
FROM tb_products
GROUP BY product_category_name
HAVING product_category_name not NULL