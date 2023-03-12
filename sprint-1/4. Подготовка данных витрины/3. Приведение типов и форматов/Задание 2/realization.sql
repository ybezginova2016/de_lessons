SELECT REPLACE(REPLACE(REPLACE(phone, '(', ''), ')', ''), ' ', '') AS phone
FROM user_contacts;


SELECT REGEXP_REPLACE(phone, '[^0-9]', '', 'g') AS phone
FROM user_contacts;
