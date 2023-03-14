-- 3.
-- Посчитайте количество уникальных значений для полей:
-- utm_campaign в таблице user_attributes,
-- client_id в таблице user_attributes.
-- Используйте префикс ecomm_marketing перед названием таблицы, к данным которой хотите
-- получить доступ. Пример обращения к таблице:  ecomm_marketing.table_name.
-- В ответе выведите одну запись с двумя полями: первое поле — количество уникальных client_id,
-- второе — количество уникальных utm_campaign.

SELECT
    COUNT (DISTINCT(utm_campaign)),
    COUNT (DISTINCT(client_id))
FROM ecomm_marketing.user_attributes;

-- для реальной базы
SELECT
    COUNT (DISTINCT(utm_campaign)),
    COUNT (DISTINCT(client_id))
FROM user_attributes
;