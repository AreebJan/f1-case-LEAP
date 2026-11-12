with

constructors as (
    select * from {{ ref('stg_constructors') }}
),

final as (
    select
        constructor_id,
        constructor_name,
        constructor_nationality
    from constructors
)

select * from final