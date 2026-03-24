select 
    source_system,
    rental_id,
    rental_date,
    cast(rental_date as date) as rental_date_key,
    return_date,
    customer_id,
    inventory_id,
    film_id,
    store_id,
    total_payment_amount,
    last_payment_date
from {{ ref('int_rental_facts') }}