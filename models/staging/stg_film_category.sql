with pagila_film_category as (
    select 'pagila' as source_system, * from {{ source('pagila', 'film_category') }}
),
sakila_film_category as (
    select 'sakila' as source_system, * from {{ source('sakila', 'film_category') }}
)
select * from pagila_film_category union all select * from sakila_film_category