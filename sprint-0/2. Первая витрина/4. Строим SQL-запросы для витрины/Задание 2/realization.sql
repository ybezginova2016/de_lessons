SELECT client_id, 
       MIN(CASE WHEN action = 'visit' THEN DATE(hitdatetime) END) AS fst_visit_dt,
       MIN(CASE WHEN action = 'registration' THEN DATE(hitdatetime) END) AS registration_dt,
       MAX(CASE WHEN action = 'registration' THEN 1 ELSE 0 END) AS is_registration
FROM user_activity_log
GROUP BY client_id
LIMIT 10;
