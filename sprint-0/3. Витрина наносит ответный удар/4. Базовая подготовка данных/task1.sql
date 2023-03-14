-- 1.
-- Сначала напишите запрос к таблице ecomm_marketing.user_attributes. Запрос должен возвращать
-- client_id и utm_campaign для всех записей с учётом критерия «В выходной таблице заполнено поле utm_campaign.
-- Все значения NULL нужно заменить на N/A». Установите лимит в 20 записей.
-- Подсказка: Используйте функцию coalesce().

SELECT client_id, COALESCE(utm_campaign, 'N/A') as utm_campaign
FROM ecomm_marketing.user_attributes
WHERE utm_campaign IS NOT NULL
LIMIT 20;

-- The COALESCE function is used to replace NULL values in the utm_campaign column with the string 'N/A'.
-- The WHERE clause is used to filter out rows where the utm_campaign column is NULL. The LIMIT clause
-- is used to limit the number of rows returned by the query to 20.