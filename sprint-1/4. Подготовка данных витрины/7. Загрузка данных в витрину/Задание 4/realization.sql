-- Вы создали для таблицы первичный ключ, состоящий из полей client_id и month. 
-- Чтобы убедиться, что индекс создался в PostgreSQL автоматически, напишите запрос к таблице метаданных pg_indexes в схеме pg_catalog, который выведет текст создания этого индекса для таблицы clients_cluster_metrics_m.

SELECT indexdef
FROM pg_indexes
WHERE tablename = 'clients_cluster_metrics_m'
AND schemaname = 'public';
