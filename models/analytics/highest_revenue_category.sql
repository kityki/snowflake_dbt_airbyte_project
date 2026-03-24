select 
    f.category_name,
    sum(rev.revenue_amount) as total_revenue
from {{ ref('fact_revenue') }} rev
join {{ ref('fact_rental') }} ren 
    on rev.rental_id = ren.rental_id 
    and rev.source_system = ren.source_system
join {{ ref('dim_film') }} f 
    on ren.film_id = f.film_id 
    and ren.source_system = f.source_system
where f.category_name is not null
group by 1
order by 2 desc