-- Таблица содержит контактные данные клиентов. Записи без указанного 
-- номера телефона, как и записи без указания клиента, не нужны.
-- Добавьте NOT NULL ограничение на колонку phone в таблице user_contacts.

ALTER TABLE user_contacts
ALTER COLUMN phone SET NOT NULL;