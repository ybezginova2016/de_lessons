-- Выведите все записи из представления за июнь 2021 года.

SELECT *
FROM client_activity
WHERE invoice_month = '2021-06-01'
;

-- Добавьте такую запись:

INSERT INTO invoice (customer_id, invoice_date, total)
VALUES (9, DATE '2021-06-01', 2);

-- The query inserts a single row into the "invoice" table with the following values:
-- customer_id: 9
-- invoice_date: June 1st, 2021
-- total: 2
-- The "invoice" table is being populated with information about customer invoices, including the customer's id, 
-- the date of the invoice, and the total amount owed.

-- Повторите первый запрос.

SELECT *
FROM client_activity
WHERE invoice_month = '2021-06-01'
;