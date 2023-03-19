/*
Задание

Реализуйте функцию с именем split_deduplication_str, которая принимает строку и символ разделителя. Функция должна
разделить входную строку на несколько строк по символу разделителя и затем убрать дубли в полученном результате.
Таким образом, получается таблица из уникальных строк. Пример:

select split_deduplication_str('1:2:1:3',':');

-- результат
--split_deduplication_str|
-------------------------+
--2                      |
--3                      |
--1                      |

Чтобы вернуть результат в качестве таблицы, используйте такой тип возвращаемого значения в функции:

RETURNS table (result_value text)
*/

-- option 1 --
-- CREATE OR REPLACE FUNCTION split_deduplication_str(str text, symbol char)
-- CREATE FUNCTION split_deduplication_str(str text, symbol char)
-- RETURNS table (result_value text) AS
-- $$
--   WITH split_strings AS (
--     SELECT unnest(string_to_array(str, symbol)) AS result_value
--   )
--   SELECT result_value
--   FROM split_strings
--   GROUP BY result_value;
-- $$
-- LANGUAGE sql;

-- option 2 --
CREATE OR REPLACE FUNCTION split_deduplication_str(str text, symbol char)
RETURNS table (result_value text) AS
$$
  WITH split_strings AS (
    SELECT unnest(regexp_split_to_table(str, symbol)) AS result_value
  )
  SELECT result_value
  FROM split_strings
  GROUP BY result_value;
$$
LANGUAGE sql;

