-- Скрипт создания таблицы начинается с команды CREATE TABLE.  В коде нужно прописать название таблицы,
-- её колонок и задать их типы . Всё это может быть указано в табличном описании. Если нет, назовите таблицы
-- и колонки так, чтобы сразу было понятно их содержание. После объявления колонок прописываются связи между
-- таблицами, затем — остальные свойства.

-- Посмотрите на скрипты создания таблицы ниже и выберите вариант, который удовлетворяет следующим условиям:

-- Схема таблицы — public, название таблицы — f_main_table.
-- Таблица содержит колонки id, second_id, third_id, other_id с типом данных BIGINT.
-- Таблица содержит ограничение первичного ключа для колонки id.
-- Таблица содержит ограничение внешнего ключа для колонки second_id.

DROP TABLE IF EXISTS public.f_main_table;

CREATE TABLE public.f_main_table(
     id           BIGINT ,
   second_id     BIGINT ,
   third_id      BIGINT ,
   other_id      BIGINT ,
   PRIMARY KEY (id),
   FOREIGN KEY (second_id) REFERENCES d_second_table(second_id) ON UPDATE cascade
);

-- The ON UPDATE CASCADE clause in the CREATE TABLE statement specifies the referential action to be taken when
-- a row in the referenced table (d_second_table) is updated.

-- In this case, when a row in d_second_table is updated and the value of the second_id
-- column is changed, the CASCADE option will propagate the change to the referencing table (f_main_table) by updating all matching rows in that table to have the new value of second_id. This ensures that the foreign key relationship between the two tables remains valid even after the update.


-- For example, if a row in d_second_table with second_id = 1 is updated to have second_id = 2,
-- all rows in f_main_table that have second_id = 1 will be updated to have second_id = 2.

-- Note that this behavior can only occur if the referenced column (second_id in d_second_table)
-- is a unique or primary key column. If it is not, the ON UPDATE CASCADE clause will cause an error.