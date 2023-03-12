SELECT REPLACE(REPLACE(REPLACE(phone, '(', ''), ')', ''), ' ', '') AS phone
FROM user_contacts;

-- The REPLACE function is used to replace specific characters in the phone field with an empty string. In this case, 
-- the REPLACE function is used three times, once each to remove parentheses and spaces. 
-- The first REPLACE function replaces ( with an empty string, the second REPLACE function replaces ) 
-- with an empty string, and the third REPLACE function replaces spaces with an empty string.

-- So, the query SELECT REPLACE(REPLACE(REPLACE(phone, '(', ''), ')', ''), ' ', '') AS phone 
-- removes extra characters from the phone field and names the result phone.