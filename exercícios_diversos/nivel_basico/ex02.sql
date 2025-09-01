-- Liste os nomes das categorias de produtos distintas ordenadas em ordem alfabética.
SELECT DISTINCT product_category_name 
FROM tb_products
WHERE product_category_name is not NULL
order BY product_category_name 