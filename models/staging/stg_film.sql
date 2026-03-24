with pagila_film as (
    select 
        'pagila' as source_system,
        film_id,
        title,
        description,
        release_year,
        language_id,
        rental_duration,
        rental_rate,
        length,
        replacement_cost,
        rating,
        last_update
    from {{ source('pagila', 'film') }}
),

sakila_film as (
    select 
        'sakila' as source_system,
        film_id,
        title,
        description,
        release_year,
        language_id,
        rental_duration,
        rental_rate,
        length,
        replacement_cost,
        rating,
        last_update
    from {{ source('sakila', 'film') }}
)

select * from pagila_film
union all
select * from sakila_film