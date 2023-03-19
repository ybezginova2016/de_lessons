-- ALTER TABLE "source_systems"
-- ADD COLUMN age integer;

-- UPDATE "source_systems"
-- SET age = b.age
-- FROM "/lessons/3. Витрина наносит ответный удар/7. Как добавить атрибуты в существующую таблицу/Задание 1/002_BUFF_clients.csv" as b
-- WHERE "source_systems".client_id = b.client_id;

ALTER TABLE public."002_DM_clients"
add age int;

-- обновление поля значениями из таблицы "002_BUFF_clients" 
UPDATE "002_DM_clients" 
SET age = dmcb.age
FROM  "002_BUFF_clients" AS dmcb 
WHERE "002_DM_clients".client_id = dmcb.client_id;
----------------------------------------------------------

-- CREATE TEMP TABLE tmp_x (client_id int, age int); -- but see below

-- COPY tmp_x FROM '/lessons/3. Витрина наносит ответный удар/7. Как добавить атрибуты в существующую таблицу/Задание 1/002_BUFF_clients.csv' (FORMAT csv);

-- UPDATE "002_Dm_clients"
-- SET    age = tmp_x.age
-- FROM   tmp_x
-- WHERE  "002_Dm_clients".client_id = tmp_x.client_id;

-- DROP TABLE tmp_x; -- else it is dropped at end of session automatically