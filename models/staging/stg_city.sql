with pagila_city as (
    select 'pagila' as source_system, * from {{ source('pagila', 'city') }}
),
sakila_city as (
    select 'sakila' as source_system, * from {{ source('sakila', 'city') }}
)
select * from pagila_city union all select * from sakila_city