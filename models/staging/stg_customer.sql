with pagila_customer as (
    select 'pagila' as source_system, * from {{ source('pagila', 'customer') }}
),
sakila_customer as (
    select 'sakila' as source_system, * from {{ source('sakila', 'customer') }}
)
select * from pagila_customer union all select * from sakila_customer