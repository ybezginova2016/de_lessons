-- 5.
-- Напишите запрос к таблице ecomm_marketing.user_payment_log. Запрос должен возвращать client_id и
-- action с учётом критерия качества «В таблице заполнено поле action. Все значения NULL нужно
-- заменить на N/A». Установите лимит в 20 записей.

SELECT client_id, COALESCE(action, 'N/A') as action
FROM ecomm_marketing.user_payment_log
WHERE action IS NOT NULL
LIMIT 20;