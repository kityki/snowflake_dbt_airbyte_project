with pagila_address as (
    select 'pagila' as source_system, * from {{ source('pagila', 'address') }}
),
sakila_address as (
    select 'sakila' as source_system, * from {{ source('sakila', 'address') }}
)
select * from pagila_address union all select * from sakila_address