with pagila_film_actor as (
    select 'pagila' as source_system, * from {{ source('pagila', 'film_actor') }}
),
sakila_film_actor as (
    select 'sakila' as source_system, * from {{ source('sakila', 'film_actor') }}
)
select * from pagila_film_actor union all select * from sakila_film_actor