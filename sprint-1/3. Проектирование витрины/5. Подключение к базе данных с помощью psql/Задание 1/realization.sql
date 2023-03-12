-- to check the types of variables

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'user_activity_log';

-- У вас есть доступ к четырём таблицам:
-- user_attributes — в этой таблице записаны данные по клиентам;
-- user_activity_log — в этой таблице хранится лог событий;
-- user_payment_log — в этой таблице хранится лог платежей;
-- user_contacts — в этой таблице хранятся контактные данные клиентов.