with films as (
    select * from {{ ref('stg_film') }}
),
film_categories as (
    select * from {{ ref('stg_film_category') }}
),
categories as (
    select * from {{ ref('stg_category') }}
)

select 
    f.source_system,
    f.film_id,
    f.title,
    f.description,
    f.release_year,
    f.rental_duration,
    f.rental_rate,
    f.length,
    f.replacement_cost,
    f.rating,
    c.name as category_name
from films f
left join film_categories fc 
    on f.film_id = fc.film_id 
    and f.source_system = fc.source_system
left join categories c 
    on fc.category_id = c.category_id 
    and fc.source_system = c.source_system