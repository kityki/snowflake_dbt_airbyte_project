with pagila_category as (
    select 'pagila' as source_system, * from {{ source('pagila', 'category') }}
),
sakila_category as (
    select 'sakila' as source_system, * from {{ source('sakila', 'category') }}
)
select * from pagila_category union all select * from sakila_category