SELECT REGEXP_REPLACE(phone, '[^0-9]', '', 'g') AS phone
FROM user_contacts;

-- The REGEXP_REPLACE function is used to replace characters that match a specified regular
-- expression pattern with an empty string. In this case, the regular expression pattern [^0-9]
-- matches any character that is not a digit. The fourth argument 'g' is a flag that specifies 
-- to perform a global search and replace, so all matching characters are replaced, not just the first one.

-- So, the query SELECT REGEXP_REPLACE(phone, '[^0-9]', '', 'g') AS phone keeps only the digits 
-- in the phone field and names the result phone.
