-- Создайте для таблицы clients_cluster_metrics_m ограничение FOREIGN KEY с наименованием 
-- clients_cluster_metrics_m_client_id_fkey на поле client_id. Идентификаторы клиентов в поле 
-- client_id могут быть только из таблицы user_attributes.

alter TABLE clients_cluster_metrics_m
add constraint clients_cluster_metrics_m_client_id_fkey foreign key(client_id)
references user_attributes(client_id);