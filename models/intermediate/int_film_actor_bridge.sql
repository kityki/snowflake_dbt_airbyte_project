with film_actors as (
    select * from {{ ref('stg_film_actor') }}
)

select 
    source_system,
    actor_id,
    film_id,
    last_update
from film_actors