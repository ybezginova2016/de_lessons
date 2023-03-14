-- Теперь напишите запрос к таблице ecomm_marketing.user_activity_log. Запрос должен возвращать client_id
-- и hitdatetime с учётом критерия качества «В таблице заполнено поле hitdatetime. Все значения NULL
-- нужно заменить на 1900-01-01». Установите лимит в 20 записей.
-- Подсказка: Используйте функцию coalesce().
SELECT client_id, COALESCE(hitdatetime, '1900-01-01') as date
FROM ecomm_marketing.user_activity_log
WHERE hitdatetime IS NOT NULL
LIMIT 20;
