SELECT REPLACE(REPLACE(REPLACE(phone, '(', ''), ')', ''), ' ', '') AS phone
FROM user_contacts;

