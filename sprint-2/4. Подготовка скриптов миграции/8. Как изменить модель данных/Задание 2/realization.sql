/*
Создайте новую колонку в таблице d_products с именем dimension_id для хранения id из таблицы d_product_dimensions.

Создайте связь между таблицами d_products и d_product_dimensions по dimension_id.

Заполните колонку dimension_id в d_products соответствующими id из d_product_dimensions.
Удалите избыточные колонки из d_product_dimensions: category_id, vendor_id, name_product, vendor_description, product_id.
*/

alter table d_products
add column dimension_id int8 NULL;

update d_products d
set (dimension_id) = (select dimension_id from d_product_dimensions dp where dp.product_id  = d.product_id);

alter table d_product_dimensions
drop column category_id;
alter table d_product_dimensions
drop column vendor_id;
alter table d_product_dimensions
drop column name_product;
alter table d_product_dimensions
drop column vendor_description;
alter table d_product_dimensions
drop column product_id;

-- -- 1) Add a new dimension_id column to the d_products table.
-- ALTER TABLE d_products
-- ADD COLUMN dimension_id BIGINT NULL;

-- -- 2) Create a foreign key relationship between the d_products and d_product_dimensions tables using the dimension_id column.
-- ALTER TABLE d_products
-- ADD CONSTRAINT fk_dimension_id
-- FOREIGN KEY (dimension_id) REFERENCES d_product_dimensions(dimension_id);

-- -- 3) Update the dimension_id column in the d_products table with the corresponding values from the d_product_dimensions table.
-- UPDATE d_products
-- SET dimension_id = d_product_dimensions.dimension_id
-- FROM d_product_dimensions
-- WHERE d_products.product_id = d_product_dimensions.product_id;

-- -- 4) Drop the redundant columns from the d_product_dimensions table.
-- ALTER TABLE d_product_dimensions
-- DROP COLUMN category_id,
-- DROP COLUMN vendor_id,
-- DROP COLUMN name_product,
-- DROP COLUMN vendor_description,
-- DROP COLUMN product_id;
