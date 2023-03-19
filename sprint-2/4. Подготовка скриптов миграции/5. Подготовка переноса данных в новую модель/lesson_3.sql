-- Заполнение новой колонки данными
/*
Представьте, что таблица d_promotions заполнена данными и содержит дополнительную
информацию в колонках sale_info и client_info. То есть в реальной таблице
d_promotions колонок sale_info и client_info нет, мы используем их для наглядности.
*/

CREATE TABLE public.d_promotions (
    promotion_id int4 NOT NULL,
    name_promotion varchar(32) NULL,
    description varchar(64) NULL,
    percents float4 NULL,
    start_date varchar(32) NULL,
    end_date varchar(32) NULL,
    sale_info text NULL,
    client_info text NULL,
    CONSTRAINT d_promotions_pkey PRIMARY KEY (promotion_id)
);

/*
Посмотрите, какие данные есть в обеих таблицах. В f_sales содержатся id продаж,
заказов и клиентов, в d_promotions — информация о клиентах и продажах, и клиентах
в колонках sale_info и client_info. С какими данными мы имеем дело?
Посмотрите во все данные таблицы d_promotions, чтобы вспомнить.
*/
SELECT *
FROM d_promotions
LIMIT 1;

/*
С client_id разобрались — по id клиента можно получить самые разные данные о клиентах. Перейдём к sale_info.
В sale_info лежит информация о продажах, разделённых символом |: id и utm_campaign. Сделайте проверочный запрос по id
    клиента и id продажи из f_sales и d_clients:
*/

SELECT fs.sale_id, fs.client_id, dc.first_name, dc.last_name
    FROM f_sales AS fs
        JOIN d_clients AS dc
            ON fs.client_id = dc.client_id
                WHERE fs.client_id = 99765 AND fs.sale_id = 41;

-- result
-- sale_id|client_id|first_name|last_name |
-- -------+---------+----------+----------+
--      41|    99765|Dima      |Luter King|

/*
Получим корректные пары promotion_id
Для этого нужно написать запрос, с помощью которого вы получите все корректно
сопоставленные promotion_id из d_promotions.
*/

select dp.promotion_id as promotion_id
    from d_promotions AS dp
      join f_sales AS fs2
        on (regexp_split_to_array(dp.client_info , '\|+'))[1]::bigint = fs2.client_id
                    and
           (regexp_split_to_array(dp.sale_info , '\|+'))[1]::bigint = fs2.sale_id;


UPDATE f_sales as fs3 SET (promotion_id) =
(select dp.promotion_id AS promotion_id
  from d_promotions AS dp
    join f_sales AS fs2
      on (regexp_split_to_array(dp.client_info , '\|+'))[1]::bigint = fs2.client_id
          and
         (regexp_split_to_array(dp.sale_info , '\|+'))[1]::bigint = fs2.sale_id
              where fs3.sale_id = fs2.sale_id and fs3.client_id = fs2.client_id);

-- Избавимся от избыточных колонок

/*
Выберите фрагмент кода, с помощью которого вы сможете удалить избыточные колонки из таблицы d_promotions.
*/
ALTER TABLE d_promotions DROP COLUMN sale_info;
ALTER TABLE d_promotions DROP COLUMN client_info;