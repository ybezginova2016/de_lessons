-- Удаление таблицы

-- Чтобы удалить таблицу, следует использовать ключевое слово DROP.
-- В скриптах миграции запросы удаления чаще всего пишут с IF EXISTS, чтобы скрипт
-- выполнялся независимо от существования таблицы, а не завершался с ошибкой из-за удаления несуществующей.

DROP TABLE IF EXISTS f_main_table;

-- Если необходимо удалить все данные из таблицы, но не саму таблицу, то используют ключевое слово TRUNCATE.
-- Если нужно ещё и удалить записи в связанных таблицах, то можно использовать TRUNCATE вместе с CASCADE,
-- которое удаляет или обновляет значения в зависимой таблице.

-- Если необходимо удалить все данные из таблицы, но не саму таблицу, то используют ключевое
-- слово TRUNCATE. Если нужно ещё и удалить записи в связанных таблицах, то можно использовать
-- TRUNCATE вместе с CASCADE, которое удаляет или обновляет значения в зависимой таблице.

-- Выберите вариант с блоком кода, который удаляет данные из таблицы f_main_table и запускает
-- обработку данных всех связанных таблиц, но не удаляет сами таблицы.

TRUNCATE f_main_table CASCADE;

-- The TRUNCATE statement in PostgreSQL is used to delete all data from a table, and the CASCADE option is
-- used to delete all dependent objects of the table as well.

-- So the request TRUNCATE f_main_table CASCADE; will delete all data from the table f_main_table and also
-- delete all dependent objects that reference this table, such as foreign keys or views.

-- Note that TRUNCATE is a faster way to delete all data from a table compared to the DELETE statement,
-- especially for large tables, as it does not scan each row before deleting it. However,
-- TRUNCATE cannot be used to selectively delete specific rows or to roll back the changes.
-- It is a one-way operation and the deleted data cannot be recovered.