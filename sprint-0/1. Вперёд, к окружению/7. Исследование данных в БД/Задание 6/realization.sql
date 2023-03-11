--Соедините таблицы user_attributes и user_activity_log по найденным связям 
--так, чтобы вошли только записи, которые есть в них обеих. В SELECT выведите все поля.
--Если все поля в найденных связях имеют одинаковые названия в левой и 
--правой таблицах, используйте USING. Если нет — ON.
--Выведите только 100 записей со столбцами левой и правой таблиц.

select
    ua.id,
    ua.client_id,
    ual.id,
    utm_campaign,
    ual.hitdatetime,
    ual.action
from user_attributes ua
inner join user_activity_log ual on ua.client_id=ual.client_id
limit 100;