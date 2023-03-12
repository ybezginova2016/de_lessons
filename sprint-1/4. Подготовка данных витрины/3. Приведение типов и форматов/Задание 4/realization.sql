SELECT cast(DATE_TRUNC('Month',TO_TIMESTAMP(updated_at,'HH24:MI:SS DD/MM/YYYY')) as DATE) as updated_month
FROM user_contacts;