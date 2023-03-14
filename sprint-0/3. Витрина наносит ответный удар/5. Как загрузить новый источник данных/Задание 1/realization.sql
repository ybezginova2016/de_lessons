DROP TABLE IF EXISTS source_systems;

CREATE TABLE source_systems (
  id serial PRIMARY KEY,
  code char(3),
  name varchar(100),
  descr varchar(255)
);

INSERT INTO source_systems (id, code, name, descr)
VALUES (1, '001', 'Moscow CRM', 'Система по работе с клиентами в офисе в Москве'),
       (2, '002', 'SPB CRM', 'Система по работе с клиентами в офисе в Санкт-Петербурге'),
       (3, '003', 'Online shop', 'Онлайн-магазин компании');