-- Quantos produtos de 'beleza_saude' com menos de 1 litro?

SELECT count(DISTINCT product_id) AS Total,
        count(*)
FROM tb_products 
WHERE product_category_name = 'beleza_saude' 
AND product_length_cm * product_height_cm * product_width_cm / 1000 < 1
-- Resposta: Temos 132 produtos de beleza e saude com menos de 1L