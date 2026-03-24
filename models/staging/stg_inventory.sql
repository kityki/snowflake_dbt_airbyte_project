with pagila_inventory as (
    select 'pagila' as source_system, * from {{ source('pagila', 'inventory') }}
),
sakila_inventory as (
    select 'sakila' as source_system, * from {{ source('sakila', 'inventory') }}
)
select * from pagila_inventory union all select * from sakila_inventory