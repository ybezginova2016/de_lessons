WITH user_activity AS (
  SELECT client_id, 
         DATE(MIN(CASE WHEN action = 'visit' THEN hitdatetime ELSE NULL END)) AS fst_visit_dt,
         DATE(MIN(CASE WHEN action = 'registration' THEN hitdatetime ELSE NULL END)) AS registration_dt,
         MAX(CASE WHEN action = 'registration' THEN 1 ELSE 0 END) AS is_registration
  FROM user_activity_log
  GROUP BY client_id
),
user_activity_and_payment AS (
  SELECT ual.client_id, 
         ua.utm_campaign, 
         ual.fst_visit_dt,
         ual.registration_dt,
         ual.is_registration,
         COALESCE(SUM(upl.payment_amount), 0) AS total_payment_amount
  FROM user_activity ual
  JOIN user_attributes ua ON ual.client_id = ua.client_id
  JOIN user_payment_log upl ON ual.client_id = upl.client_id
  GROUP BY ual.client_id, 
           ua.utm_campaign, 
           ual.fst_visit_dt,
           ual.registration_dt,
           ual.is_registration
)
SELECT client_id, 
       utm_campaign, 
       fst_visit_dt,
       registration_dt,
       is_registration,
       total_payment_amount
FROM user_activity_and_payment;
SELECT table_name, column_name, is_nullable
FROM information_schema.columns
WHERE table_name in ('user_payment_log','user_activity_log','user_attributes')
AND is_nullable = 'YES'