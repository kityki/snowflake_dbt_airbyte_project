with rentals as (
    select * from {{ ref('stg_rental') }}
),

inventory as (
    select * from {{ ref('stg_inventory') }}
),

payments as (
    select 
        source_system,
        rental_id,
        sum(amount) as total_payment_amount,
        max(payment_date) as last_payment_date
    from {{ ref('stg_payment') }}
    group by 1, 2
)

select 
    r.source_system,
    r.rental_id,
    r.rental_date,
    r.return_date,
    r.customer_id,
    i.inventory_id,
    i.film_id,
    i.store_id,
    p.total_payment_amount,
    p.last_payment_date
from rentals r
left join inventory i 
    on r.inventory_id = i.inventory_id 
    and r.source_system = i.source_system
left join payments p 
    on r.rental_id = p.rental_id 
    and r.source_system = p.source_system