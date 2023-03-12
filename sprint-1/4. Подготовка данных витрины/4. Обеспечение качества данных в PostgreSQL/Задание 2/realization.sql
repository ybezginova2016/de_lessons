-- Добавление FK-ограничения на поле client_id в таблице user_contacts ещё 
-- не гарантирует, что оно не может принимать значение NULL. Записи без указания 
-- клиента в таблице с клиентскими контактными данными совершенно не имеют смысла.
-- Добавьте NOT NULL ограничение на колонку client_id в таблице user_contacts. 
-- Напишите ALTER TABLE выражение.

ALTER TABLE user_contacts
ALTER COLUMN client_id SET NOT NULL;