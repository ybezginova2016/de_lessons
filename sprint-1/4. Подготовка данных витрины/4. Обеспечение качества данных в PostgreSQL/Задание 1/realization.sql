ALTER TABLE user_contacts
ADD CONSTRAINT user_contacts_client_id_fkey 
FOREIGN KEY (client_id)
REFERENCES user_attributes (client_id);

-- Добавьте ограничение по внешнему ключу с названием user_contacts_client_id_fkey 
-- в уже существующую таблицу user_contacts.
-- Оно должно сделать так, что в поле client_id таблицы user_contacts будут попадать 
-- только значения client_id из таблицы user_attributes.