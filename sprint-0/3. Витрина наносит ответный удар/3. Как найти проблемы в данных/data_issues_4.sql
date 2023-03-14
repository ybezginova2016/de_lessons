-- 4.
-- Посчитайте количество уникальных значений для поля с данными о том, какое действие совершил
-- пользователь, в таблице user_activity_log.
-- Используйте префикс ecomm_marketing перед названием таблицы, к данным которой хотите получить доступ.
-- Пример обращения к таблице:  ecomm_marketing.table_name.

-- SELECT
--     COUNT(DISTINCT(action))
-- FROM ecomm_marketing.user_activity_log;

SELECT
    COUNT(DISTINCT(action))
FROM user_activity_log;