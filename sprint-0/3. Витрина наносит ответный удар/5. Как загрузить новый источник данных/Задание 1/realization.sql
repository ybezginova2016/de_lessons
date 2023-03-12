SELECT table_name, column_name, is_nullable
FROM information_schema.columns
WHERE table_name in ('user_payment_log','user_activity_log','user_attributes')
AND is_nullable = 'YES'