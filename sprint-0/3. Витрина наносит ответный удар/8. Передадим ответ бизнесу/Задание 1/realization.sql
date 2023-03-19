-- SELECT * FROM pg_matviews;

drop materialized view if exists user_activity_payment_datamart;

CREATE MATERIALIZED VIEW user_activity_payment_datamart AS
(
WITH ual AS (
        SELECT client_id,
                                 DATE(MIN(CASE WHEN action = 'visit' THEN hitdatetime ELSE NULL END)) AS fst_visit_dt,
                                 DATE(MIN(CASE WHEN action = 'registration' THEN hitdatetime ELSE NULL END)) AS registration_dt,
                                 MAX(CASE WHEN action = 'registration' THEN 1 ELSE 0 END) AS is_registration
        FROM user_activity_log
        GROUP BY client_id
),

upl AS (
  SELECT client_id,
                           SUM(payment_amount) AS total_payment_amount
  FROM user_payment_log
        GROUP BY client_id
)
SELECT ua.client_id,
       ua.utm_campaign,
       ual.fst_visit_dt,
       ual.registration_dt,
       ual.is_registration,
       upl.total_payment_amount,
           uages.age
           
FROM user_attributes AS ua
LEFT JOIN ual ON ua.client_id = ual.client_id
LEFT JOIN upl ON ua.client_id = upl.client_id
LEFT JOIN public."002_DM_clients" as uages on ua.client_id = uages.client_id

)