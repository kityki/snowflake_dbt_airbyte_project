with pagila_actor as (
    select 
        'pagila' as source_system,
        actor_id,
        first_name,
        last_name,
        last_update
    from {{ source('pagila', 'actor') }}
),

sakila_actor as (
    select 
        'sakila' as source_system,
        actor_id,
        first_name,
        last_name,
        last_update
    from {{ source('sakila', 'actor') }}
)

select * from pagila_actor
union all
select * from sakila_actor