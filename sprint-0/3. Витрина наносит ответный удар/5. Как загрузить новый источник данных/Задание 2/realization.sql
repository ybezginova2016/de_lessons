-- DROP TABLE IF EXISTS clients;

COPY clients (client_firstname, client_lastname, client_email, client_phone, client_city)
FROM '/lessons/3. Витрина наносит ответный удар/5. Как загрузить новый источник данных/Задание 2/clients.csv'
WITH (FORMAT csv, HEADER true);