-- 4.
-- Напишите запрос к таблице ecomm_marketing.user_payment_log. Запрос должен возвращать client_id и
-- hitdatetime с учётом критерия качества «В таблице заполнено поле hitdatetime. Все значения NULL
-- нужно заменить на 1900-01-01». Установите лимит в 20 записей.

SELECT client_id, COALESCE(hitdatetime, '1900-01-01') as date
FROM ecomm_marketing.user_payment_log
WHERE hitdatetime IS NOT NULL
LIMIT 20;
