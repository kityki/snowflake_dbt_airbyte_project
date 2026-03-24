select 
    source_system,
    payment_id,
    customer_id,
    rental_id,
    amount as revenue_amount,
    payment_date,
    cast(payment_date as date) as revenue_date_key
from {{ ref('stg_payment') }}