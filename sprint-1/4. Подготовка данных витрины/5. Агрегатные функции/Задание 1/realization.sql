-- https://www.postgresql.org/docs/current/functions-aggregate.html

-- В  итоговой витрине несколько метрик представляли из себя количество событий разных типов над таблицей user_activity_log. 
-- Напишите SQL-запрос над этой таблицей, который вернёт 5 полей:
-- client_id — идентификатор клиента;
-- month — месяц данных (должен иметь тип date);
-- visit_events — количество событий с типом visit за месяц;
-- registration_events — количество событий с типом registration за месяц;
-- login_events — количество событий с типом login за месяц.

SELECT client_id,
       date_trunc('month', occurred_at) AS month,
       SUM(CASE WHEN action = 'visit' THEN 1 ELSE 0 END) AS visit_events,
       SUM(CASE WHEN action = 'registration' THEN 1 ELSE 0 END) AS registration_events,
       SUM(CASE WHEN action = 'login' THEN 1 ELSE 0 END) AS login_events
FROM user_activity_log
GROUP BY client_id, date_trunc('month', occurred_at);
