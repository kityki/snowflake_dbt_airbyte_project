with customers as (
    select * from {{ ref('stg_customer') }}
),

addresses as (
    select * from {{ ref('stg_address') }}
),

cities as (
    select * from {{ ref('stg_city') }}
)

select 
    c.source_system,
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.active,
    a.address,
    a.district,
    ci.city
from customers c
left join addresses a 
    on c.address_id = a.address_id 
    and c.source_system = a.source_system
left join cities ci 
    on a.city_id = ci.city_id 
    and a.source_system = ci.source_system