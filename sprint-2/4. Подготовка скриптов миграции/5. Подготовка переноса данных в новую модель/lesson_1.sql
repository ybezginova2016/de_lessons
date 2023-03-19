-- Изменение и внесение данных в таблицы

/*
Таблица d_promotions заполняется данными о клиентах и продажах, а значит, содержит
    избыточную информацию и потенциально неконсистентные данные — данные, которые отсутствуют
        в таблицах d_clients и f_sales. Наоборот это тоже работает — f_sales и d_clients
            могут содержать информацию, которой недостаёт в d_promotions. Также нарушена
            связь с другими таблицами, что осложняет выполнение аналитических запросов.
Если вы создадите связь между f_sales и d_promotions, все данные в этой модели будут
            связаны между собой заданными ключами.
Как связать f_sales и d_promotions?
Как вы уже знаете, связь между таблицами обеспечивают ключи. В d_promotions
    существует первичный ключ promotion_id.
*/

CREATE TABLE public.d_promotions (
    promotion_id int4 NOT NULL,
    name_promotion varchar(32) NULL,
    description varchar(64) NULL,
    percents float4 NULL,
    start_date varchar(32) NULL,
    end_date varchar(32) NULL,
    CONSTRAINT d_promotions_pkey PRIMARY KEY (promotion_id)
);

CONSTRAINT d_promotions_pkey PRIMARY KEY (promotion_id)

-- Создадим новую колонку
/*
Для добавления колонки достаточно указать, какую таблицу вы меняете и какое действие
    над ней совершаете. После ALTER TABLE укажите имя таблицы, затем пишите действие ADD COLUMN
    (добавление колонки), дальше указывайте атрибуты колонки (имя, тип и другое).
    Выберите фрагмент кода, с помощью которого вы сможете добавить колонку promotion_id с
    типом данных int8 в таблицу f_sales
*/
ALTER TABLE f_sales ADD COLUMN promotion_id int8;

-- Наполним колонку данными
/*
Вы добавили колонку в таблицу f_sales, но в ней уже есть данные. Значит, и добавленная колонка
promotion_id тоже должна содержать данные.
Если при добавлении новой колонки не указать значение по умолчанию, оно будет установлено
как NULL. Но можно установить другое значение по умолчанию. Для этого нужно использовать
команду DEFAULT и с ней нужное значение.
Выберите фрагмент кода, с помощью которого вы сможете по умолчанию заполнить нулями созданную колонку.
*/
-- Так вы заполните колонку нулями.
ALTER TABLE f_sales ADD COLUMN promotion_id int8 DEFAULT 0;