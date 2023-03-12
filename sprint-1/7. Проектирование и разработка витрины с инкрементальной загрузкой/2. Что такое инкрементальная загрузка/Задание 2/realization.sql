SELECT hitdatetime:: date as date, COUNT(*) AS count
FROM user_activity_log
GROUP BY DATE(hitdatetime)
ORDER BY date ASC;