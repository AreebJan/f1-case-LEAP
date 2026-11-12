with

drivers as (
    select * from {{ ref('stg_drivers') }}
),

final as (
    select
        driver_id,
        full_name,
        driver_code,
        driver_nationality
    from drivers
)

select * from final