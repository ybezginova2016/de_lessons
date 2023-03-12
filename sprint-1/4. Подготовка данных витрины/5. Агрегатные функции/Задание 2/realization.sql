-- Использование оконных функций

-- Вызовы агрегатных функций не могут включать вызовы оконных функций. Поэтому строить 
-- агрегатные функции над полем, которое было собрано через оконную функцию, нужно или в подзапросе, или в CTE.
-- Покажем использование агрегатных и оконных функций на примере метрики events_delta_avg_sec, 
-- которая отражает среднее время между событиями в секундах по каждому клиенту над таблицей user_payment_log:

SELECT client_id,
       avg(extract(epoch
                   FROM (hitdatetime - prev_hitdatetime))) AS events_delta_avg_sec
FROM
  (SELECT client_id,
          hitdatetime,
          lag(hitdatetime) OVER (PARTITION BY client_id
                                 ORDER BY hitdatetime) prev_hitdatetime
   FROM user_payment_log)t
GROUP BY client_id; 

-- В подзапросе через оконную функцию lag к таблице добавляется время предыдущего события 
-- по каждому клиенту, после чего усредняется разница между временем текущего и предыдущего события.
-- Конструкция extract(epoch from ...) используется для того, чтобы тип данных interval  
-- (разница между timestamp) привести к числовому типу — секундам между событиями.


-- Одной из необходимых метрик в витрине была visit_to_login_events, или количество 

-- событий типа login после события visit за месяц по каждому клиенту. Промежуток времени между событиями не ограничен.
--  Напишите SQL-запрос над таблицей user_activity_log, который вернёт три поля: 

-- client_id — идентификатор клиента;
-- month — месяц данных (должен иметь тип date);
-- visit_to_login_events — количество событий типа login, следующих сразу, без каких-либо 
-- промежуточных событий, после события visit за месяц.

-- option 1

select client_id,
	date_trunc('month', hitdatetime) AS month,
	count(
		case
	  		when action	 = 'login' then 1
	  	end
	) as visit_to_login_events
from user_activity_log
group by client_id, month;


-- option 2 

WITH user_activity_log_cte AS (
  SELECT client_id,
         hitdatetime,
         action,
         LAG(action) OVER (PARTITION BY client_id ORDER BY hitdatetime) AS prev_action
  FROM user_activity_log
)
SELECT client_id,
       CAST(DATE_TRUNC('month', hitdatetime) AS DATE) AS month,
       COUNT(CASE WHEN action = 'login' AND prev_action = 'visit' THEN 1 END) AS visit_to_login_events
FROM user_activity_log_cte
GROUP BY client_id, month;

