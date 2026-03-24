with pagila_payment as (
    select 'pagila' as source_system, * from {{ source('pagila', 'payment') }}
),
sakila_payment as (
    select 'sakila' as source_system, * from {{ source('sakila', 'payment') }}
)
select * from pagila_payment union all select * from sakila_payment