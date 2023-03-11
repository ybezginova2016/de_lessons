select
    ua.id,
    ua.client_id,
    upl.id,
    utm_campaign,
    upl.hitdatetime,
    upl.action,
    upl.payment_amount
from user_attributes ua
join user_payment_log upl on ua.client_id=upl.client_id
limit 100;


