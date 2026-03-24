select 
    f.source_system,
    f.film_id,
    f.title,
    f.category_name
from {{ ref('dim_film') }} f
left join {{ ref('stg_inventory') }} i 
    on f.film_id = i.film_id 
    and f.source_system = i.source_system
where i.inventory_id is null