-- Проверьте корректность значений метрики visit_events — количество событий типа visit по каждому клиенту в месяц из таблицы user_activity_log. Сама метрика уже построена в CTE. Дополните запрос, построив с помощью агрегатных функций следующую статистику:
-- visit_events_min — минимальное значение метрики;
-- visit_events_max — максимальное значение метрики;
-- visit_events_avg — среднее значение метрики;
-- visit_events_null — количество пустых значений метрики;
-- visit_events_zero — количество нулевых значений метрики;
-- visit_events_zero_pct — процент нулевых значений метрики по всей таблице;
-- visit_events_nonzero — количество ненулевых значений метрики.


WITH cte AS (
    SELECT client_id,
        CAST(DATE_TRUNC('Month',hitdatetime) AS date) "month",
        COUNT(CASE WHEN "action" = 'visit' THEN 1 END) visit_events
    FROM user_activity_log
    WHERE EXTRACT(YEAR FROM hitdatetime) = 2021
    GROUP BY client_id, CAST(DATE_TRUNC('Month',hitdatetime) AS date)
)
SELECT 
    MIN(visit_events) AS visit_events_min,
    MAX(visit_events) AS visit_events_max,
    AVG(visit_events) AS visit_events_avg,
    SUM(CASE WHEN visit_events IS NULL THEN 1 ELSE 0 END) AS visit_events_null,
    SUM(CASE WHEN visit_events = 0 THEN 1 ELSE 0 END) AS visit_events_zero,
    SUM(CASE WHEN visit_events = 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS visit_events_zero_pct,
    SUM(CASE WHEN visit_events != 0 THEN 1 ELSE 0 END) AS visit_events_nonzero
FROM cte;

-- Для первых трёх проверок используйте функции MIN, MAX и AVG, а для последних трёх — выражение CASE.
-- Для подсчёта процента нулевых записей, поделите количество нулевых записей на общее по всей таблице.
-- Не забудьте умножить на 100 и привести к вещественному типу.


WITH cte AS (
    SELECT client_id,
        CAST(DATE_TRUNC('Month',hitdatetime) AS date) "month",
        COUNT(CASE WHEN "action" = 'visit' THEN 1 END) visit_events
    FROM user_activity_log
    WHERE EXTRACT(YEAR FROM hitdatetime) = 2021
    GROUP BY client_id, CAST(DATE_TRUNC('Month',hitdatetime) AS date)
)
SELECT
    CASE
        WHEN visit_events >= 12 THEN '12+'
        WHEN visit_events >= 10 THEN '10_12'
        WHEN visit_events >= 5 THEN '05_10'
        WHEN visit_events >= 3 THEN '03_05'
        WHEN visit_events >= 2 THEN '02_03'
        WHEN visit_events = 1 THEN '01'
        WHEN visit_events = 0 THEN '00'
        END bucket,
    COUNT(*) records
FROM cte
GROUP BY bucket;