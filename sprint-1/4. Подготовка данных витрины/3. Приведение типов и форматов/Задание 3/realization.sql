SELECT SUBSTR(REGEXP_REPLACE(REPLACE(REPLACE(REPLACE(phone, '(', ''), ')', ''), ' ', ''), '[^0-9]', '', 'g'), 2, 3) AS reg_code
FROM user_contacts;
