ALTER TABLE "source_systems"
ADD COLUMN age integer;

UPDATE "source_systems"
SET age = b.age
FROM "/lessons/3. Витрина наносит ответный удар/7. Как добавить атрибуты в существующую таблицу/Задание 1/002_BUFF_clients.csv" as b
WHERE "source_systems".client_id = b.client_id;

