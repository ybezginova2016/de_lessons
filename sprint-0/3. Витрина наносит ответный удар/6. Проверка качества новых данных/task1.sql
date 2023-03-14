-- 1.
-- В следующих двух заданиях вам нужно будет написать запросы, которые проверят, все ли данные загружены и соответствуют ли они критериям качества. Нужные данные хранятся в таблице ecomm_marketing_clients."002_DM_clients".
-- Критерий для первой проверки — «Поля client_id, client_firstname, client_lastname и client_email заполнены, в них нет пустых значений».
-- Ваша задача — вывести все записи, где хотя бы одно поле не соответствует критерию.

-- Для проверки используйте команду IS NULL.
-- Вы можете проверить несколько полей за раз, используя OR в WHERE.
-- Убедитесь, что 002_DM_clients заключено в двойные кавычки.

SELECT *
FROM ecomm_marketing_clients."002_DM_clients"
WHERE client_id IS NULL OR client_firstname IS NULL
    OR client_lastname IS NULL
    OR client_email IS NULL;
