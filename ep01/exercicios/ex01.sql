-- Ex1: Quantos produtos temos da categoria 'artes'?
-- count() conta os registros
-- distinct apresenta apenas valores unicos
SELECT count(DISTINCT product_id) as Total
FROM tb_products 
WHERE product_category_name = 'artes'

-- Resposta - 55 produtos pertencem a categoria "artes"