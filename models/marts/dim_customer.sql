select 
    source_system,
    customer_id,
    first_name,
    last_name,
    email,
    active,
    address,
    district,
    city
from {{ ref('int_customer_enriched') }}