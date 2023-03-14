-- 2
-- Посчитайте, сколько всего записей в каждой таблице.
-- Запрос должен вернуть два столбца — столбец с названиями таблиц и столбец с количеством строк.
-- Названию таблицы должно соответствовать число строк в ней.
-- Используйте префикс ecomm_marketing перед названием таблицы, к данным которой хотите получить
-- доступ. Пример обращения к таблице:  ecomm_marketing.table_name.

-- для тренажера
-- SELECT 'user_attributes',
-- (SELECT count(1) from ecomm_marketing.user_attributes)
-- UNION ALL
-- SELECT 'user_activity_log',
-- (SELECT count(1) from ecomm_marketing.user_activity_log)
-- UNION ALL
-- SELECT 'user_payment_log',
-- (SELECT count(1) from ecomm_marketing.user_payment_log)

-- для реальной базы
SELECT 'user_attributes' as table_name, count(1) as num_rows
FROM user_attributes
UNION ALL
SELECT 'user_activity_log' as table_name, count(1) as num_rows
FROM user_activity_log
UNION ALL
SELECT 'user_payment_log' as table_name, count(1) as num_rows
FROM user_payment_log
;

