-- outra forma de trabalhar com o NULL sem fazer o case when é com COALESCE
-- Ele verifica se a coluna tem um valor não nulo e a retorna, caso seja nulo, retorna 'outros'
SELECT DISTINCT coalesce(product_category_name, 'outros')
AS categorias_fillna

FROM tb_products  

order BY product_category_name 