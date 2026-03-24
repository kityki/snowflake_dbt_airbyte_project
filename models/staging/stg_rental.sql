with pagila_rental as (
    select 'pagila' as source_system, * from {{ source('pagila', 'rental') }}
),
sakila_rental as (
    select 'sakila' as source_system, * from {{ source('sakila', 'rental') }}
)
select * from pagila_rental union all select * from sakila_rental