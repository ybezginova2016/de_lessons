---------------------------------------Task 1-------------------------------------------
CREATE TABLE public.third_table (
  third_table_id int8 NOT NULL,
  id_my_table int8 NULL,
  property_date timestamp NULL,
  property_varchar varchar(20) NULL,
  property_numeric numeric(14, 2) NULL,
  CONSTRAINT third_table_pkey PRIMARY KEY (third_table_id),
  CONSTRAINT third_table_id_fkey FOREIGN KEY (id_my_table)
      REFERENCES public.my_table(id_my_table) ON UPDATE CASCADE
);
-- Колонка property_varchar не может иметь значения NULL.
-- NULL в конце объявления колонки говорит, что колонка может содержать значения NULL.

-- Колонка third_table_id не может иметь значения NULL.
-- NOT NULL в конце объявления колонки говорит, что колонка не должна содержать значения NULL.

-- Колонка property_numeric должна содержать числовые значения с фиксированной точкой.
-- Тип numeric(14,2) говорит, что в колонке property_numeric содержатся числовые значения с
-- фиксированной точкой длиной в 14 цифр до запятой и 2 цифры — после.

---------------------------------------Task 2-------------------------------------------

CREATE TABLE public.second_table (
  second_id int8 NOT NULL,
  id_my_table int8 NULL,
  property_second_table varchar NULL,
  other_property varchar(20) NULL,
  CONSTRAINT second_table_pkey PRIMARY KEY (second_id),
  CONSTRAINT second_table_fkey FOREIGN KEY (id_my_table) REFERENCES public.my_table(id_my_table) ON UPDATE CASCADE
);

-- Колонка second_id содержит уникальные значения в рамках таблицы second_table.
-- Ограничение PRIMARY KEY гарантирует для колонки уникальность значений в рамках всей таблицы. Если попытаться
-- добавить в колонку существующее значение, запрос завершится с ошибкой.
--
-- Колонка id_my_table в таблицах second_table и third_table является внешним ключом для таблицы my_table.
-- Ключевые слова FOREIGN KEY и REFERENCES говорят, что в таблице second_table существует связь с таблицей
-- my_table по внешнему ключу, колонке id_my_table.
--
-- Тип int8 определяет для колонки значения числового типа. А цифра 8 говорит, что этот тип данных
-- будет занимать в памяти 8 байт.
