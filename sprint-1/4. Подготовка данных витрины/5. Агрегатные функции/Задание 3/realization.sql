-- Переходим к таблице user_payment_log. Чтобы правильнее выбирать время запуска рекламных кампаний, 
-- бизнесу интересно, как много клиентов проявляют активность не в дневное время. 

-- Напишите SQL-запрос над таблицей user_payment_log, который вернёт 2 поля:
-- client_id — идентификатор клиента;
-- daily_actions_pct — процент действий клиента, совершённых в промежутке с 12 до 18 часов (не включая правую границу 18:00), от всех действий клиента в таблице.
-- Считаем, что все клиенты находятся в одном часовом поясе и данные в базе соответствуют этому поясу.

WITH client_actions AS (
  SELECT
    client_id,
    COUNT(*) AS total_actions,
    COUNT(CASE
      WHEN extract(hour from occurred_at) BETWEEN 12 AND 17 THEN 1
    END) AS daily_actions
  FROM user_payment_log
  GROUP BY client_id
)
SELECT
  client_id,
  daily_actions * 100.0 / total_actions AS daily_actions_pct
FROM client_actions;

