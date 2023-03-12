
update clients
set 
client_firstname = forupdate.client_firstname,
client_lastname = forupdate.client_lastname,
client_email = forupdate.client_email,
client_phone = forupdate.client_phone,
client_city = forupdate.client_city,
age = forupdate.age
from 
	(select 
	client_id,
	client_firstname,
	client_lastname,
	client_email,
	client_phone,
	client_city,
	age
	from (
	select 
	ci.client_id,
	ci.client_firstname,
	ci.client_lastname,
	ci.client_email,
	ci.client_phone,
	ci.client_city,
	ci.age,
	case 
		when c.age is null then 'I'
		else 'U'
	end as "action"
	from 
		clients_inc as ci
	left outer join
		clients as c
	on ci.client_id = c.client_id
	and (ci.client_firstname <> c.client_firstname
	or ci.client_lastname <> c.client_lastname
	or ci.client_email <> c.client_email
	or ci.client_phone <> c.client_phone
	or ci.client_city <> c.client_city
	or ci.age <> c.age)
	) as inc
	where "action" = 'U') as forupdate
where clients.client_id = forupdate.client_id
