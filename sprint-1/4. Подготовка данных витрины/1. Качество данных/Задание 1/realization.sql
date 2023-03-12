SELECT COUNT(*) AS total, 
COUNT(DISTINCT client_id) AS uniq
FROM user_attributes;
