-- Создайте для таблицы clients_cluster_metrics_m ограничение: составной PRIMARY KEY с
--  наименованием clients_cluster_metrics_m_month_client_id_pkey.

alter TABLE clients_cluster_metrics_m
add constraint clients_cluster_metrics_m_month_client_id_pkey primary key(client_id, month);