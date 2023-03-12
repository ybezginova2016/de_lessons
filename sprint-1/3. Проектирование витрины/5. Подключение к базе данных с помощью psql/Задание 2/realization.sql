SELECT *
FROM pg_catalog.pg_tables
WHERE schemaname = 'public'
    AND tablename = 'user_payment_log';

-- check the types of each variable
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'user_activity_log';

select *
from user_payment_log;

SELECT *
FROM user_activity_log;
