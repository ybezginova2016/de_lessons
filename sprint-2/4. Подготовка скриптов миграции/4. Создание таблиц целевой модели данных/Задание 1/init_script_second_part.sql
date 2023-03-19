-- Таблицы должны создаваться в схеме public и иметь следующие атрибуты:

-- Колонки first_name, last_name имеют тип text без ограничения длины текста.
-- Колонки utm_campaign, action имеют тип VARCHAR с ограничением количества символов.
-- Для utm_campaign — 30 символов, для action — 20 символов.

-- Колонка hit_date_time имеет тип timestamp.

-- Колонки payment_amount, payment, num имеют тип NUMERIC. Количество цифр в числе 14, а количество цифр после запятой — 2.
-- Для всех таблиц, кроме f_sales, создайте индекс по первичному ключу. Для таблицы f_sales создайте индекс
-- по колонке order_id. Индексы должны иметь следующие названия:
-- client_id_index, user_payment_log_id_index, user_activity_id_index, order_id_index, bucket_id_index, sales_order_id_index.
-- В результате выполнения скрипта должны создаться таблицы с перечисленными выше свойствами и индексами.
-- При повторном запуске скрипта таблицы должны быть удалены и заново созданы.

DROP TABLE IF EXISTS public.d_user_payment_log;
DROP TABLE IF EXISTS public.d_user_activity_log;
DROP TABLE IF EXISTS public.f_sales;
DROP TABLE IF EXISTS public.d_clients;
DROP TABLE IF EXISTS public.d_buckets;
DROP TABLE IF EXISTS public.d_orders;
-- drop d_products;
-- drop d_vendors;
-- drop d_categories;

--d_clients
CREATE TABLE public.d_clients(
   client_id    BIGINT ,
   first_name   text ,
   last_name    text ,
   utm_campaign VARCHAR(30),
   PRIMARY KEY  (client_id)
);
CREATE INDEX client_id_index ON public.d_clients(client_id);

-- Колонки sale_id, order_id, bucket_id, product_id, category_id, client_id, activity_id,
-- payment_log_id имеют тип BIGINT без автоинкремента и являются первичными ключами.

--d_user_payment_log
CREATE TABLE public.d_user_payment_log(
   payment_log_id   BIGINT ,
   client_id      	BIGINT ,
   hit_date_time    TIMESTAMP ,
   action           VARCHAR(20),
   payment_amount   NUMERIC(14,2),
   PRIMARY KEY 		(payment_log_id),
   FOREIGN KEY 		(client_id) REFERENCES d_clients(client_id) ON UPDATE cascade
);
CREATE INDEX user_payment_log_id_index  ON public.d_user_payment_log (payment_log_id);

--d_user_activity_log
CREATE TABLE public.d_user_activity_log(
   activity_id    BIGINT ,
   client_id      BIGINT ,
   hit_date_time  TIMESTAMP ,
   action         VARCHAR(20),
   PRIMARY KEY  (activity_id),
   FOREIGN KEY  (client_id) REFERENCES d_clients(client_id) ON UPDATE cascade
);
CREATE INDEX user_activity_id_index ON public.d_user_activity_log (activity_id);

-- create d_vendors

-- create d_categories

-- create d_products

--d_orders
CREATE TABLE public.d_orders(
   order_id      BIGINT ,
   payment       NUMERIC(14,2),
   hit_date_time TIMESTAMP,
   PRIMARY KEY (order_id)
);
CREATE INDEX order_id_index ON public.d_orders (order_id);

--d_buckets
CREATE TABLE public.d_buckets(
   bucket_id    BIGINT ,
   order_id     BIGINT ,
   product_id   BIGINT ,
   num          NUMERIC(14,2),
   PRIMARY KEY (bucket_id),
   FOREIGN KEY (product_id) REFERENCES d_products(product_id) ON UPDATE CASCADE,
   FOREIGN KEY (order_id) REFERENCES d_orders(order_id) ON UPDATE CASCADE
);
CREATE INDEX bucket_id_index ON public.d_buckets (bucket_id);

--sales information
CREATE TABLE public.f_sales(
   sale_id        BIGINT ,
   order_id       BIGINT ,
   client_id      BIGINT ,
   promotion_id   BIGINT ,
   PRIMARY KEY (sale_id),
   FOREIGN KEY (order_id) REFERENCES d_orders(order_id) ON UPDATE cascade,
   FOREIGN KEY (client_id) REFERENCES d_clients(client_id) ON UPDATE cascade
);
CREATE INDEX sales_order_id_index ON public.f_sales (order_id);