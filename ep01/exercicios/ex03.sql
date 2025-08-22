-- Crie uma coluna nova que contenha a informação de volume em m3
-- Para transformar em m3 fazemos: Comprimento x Largura x Altura, em metros.
-- Sabemos que tem as  colunas: product_length_cm	product_height_cm	product_width_cm
-- Cm³ para m³, fazemos * 1000000

SELECT *, product_length_cm * product_height_cm * product_width_cm / 1000000
AS product_volumeM3
FROM
tb_products