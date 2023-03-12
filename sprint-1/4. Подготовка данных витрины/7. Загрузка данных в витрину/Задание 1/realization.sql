
create table clients_cluster_metrics_m (
    month date,
    client_id bigint,
    utm_campaign varchar(30), 
    reg_code varchar(3),
    total_events bigint,
    visit_events bigint,
    registration_events bigint,
    login_events bigint,
    visit_to_login_events bigint,
    total_pay_events bigint,
    accepted_method_actions bigint,  
    avg_payment double precision,
    made_payments bigint,
    sum_payments double precision,
    rejects_share double precision);
