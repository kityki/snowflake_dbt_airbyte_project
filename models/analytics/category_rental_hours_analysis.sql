select 
    f.category_name,
    round(avg(datediff('hour', r.rental_date, r.return_date)), 2) as avg_rental_hours,
    sum(datediff('hour', r.rental_date, r.return_date)) as total_rental_hours
from {{ ref('fact_rental') }} r
join {{ ref('dim_film') }} f 
    on r.film_id = f.film_id 
    and r.source_system = f.source_system
where r.return_date is not null
group by 1
order by 2 desc