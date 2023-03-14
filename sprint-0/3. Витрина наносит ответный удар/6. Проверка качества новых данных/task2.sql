-- 2.
-- Критерий качества для второй проверки: «Поля client_phone, client_city заполнены,
-- в них нет пустых значений». Выведите все поля всех записей, где критерий не выполняется.
-- Нужные данные хранятся в таблице ecomm_marketing_clients."002_DM_clients".

SELECT *
FROM ecomm_marketing_clients."002_DM_clients"
WHERE client_phone IS NULL OR client_city IS NULL;