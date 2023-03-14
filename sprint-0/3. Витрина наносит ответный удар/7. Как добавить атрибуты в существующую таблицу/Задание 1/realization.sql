DROP TABLE IF EXISTS source_systems;

ALTER TABLE source_systems
ADD COLUMN age integer;

UPDATE source_systems
SET age = b.age
FROM "002_BUFF_clients" b
WHERE clients.client_id = b.client_id;

