-- categorias distintas de produtos removendo os nulos
SELECT DISTINCT product_category_name
FROM tb_products  
WHERE product_category_name is not NULL 
order BY product_category_name 

-- podemos criar uma condição caso o valor for nulo e tratá-lo ao invés de apenas remove-lo
SELECT 
    DISTINCT CASE WHEN product_category_name IS NULL THEN 'outros'
        ELSE product_category_name END AS categorias_fillna
FROM tb_products  
order by product_category_name

-- com isso em mãos, podemos expandir os CASE WHEN e fazer vários casos. Seria muito parecido com IF ELIF e ELSE do python. 
SELECT DISTINCT CASE 
        WHEN product_category_name IS NULL 
            THEN 'outros'
        WHEN product_category_name = 'alimentos' OR product_category_name = 'alimentos_bebidas'
            THEN 'alimentos'
    -- outra forma
        WHEN product_category_name in ('artes', 'artes_e_artesanato') 
            THEN 'artes'
    -- usando LIKE == verifica se o nome contém. % é usado para verificar se é no começo, meio ou fim.
        WHEN product_category_name LIKE "artigos%"
            THEN 'artigos'
        ELSE product_category_name 
    END AS categorias_fillna
FROM tb_products  
order by product_category_name