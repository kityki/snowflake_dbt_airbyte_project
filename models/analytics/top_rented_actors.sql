select 
    a.first_name,
    a.last_name,
    count(r.rental_id) as total_rentals
from {{ ref('fact_rental') }} r
join {{ ref('int_film_actor_bridge') }} b 
    on r.film_id = b.film_id 
    and r.source_system = b.source_system
join {{ ref('dim_actor') }} a 
    on b.actor_id = a.actor_id 
    and b.source_system = a.source_system
group by 1, 2
order by 3 desc