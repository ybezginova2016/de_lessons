-- обновите представление и снова запросите данные за май 2021
REFRESH MATERIALIZED VIEW client_activity;

SELECT *
FROM client_activity
WHERE invoice_month = '2021-05-01'
;

INSERT INTO invoice (customer_id, invoice_date, total)
VALUES (9, DATE '2021-05-01', 2);

SELECT *
FROM client_activity
WHERE invoice_month = '2021-05-01'
;