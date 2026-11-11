with

source as (
    select * from {{ ref('stg_drivers') }}
),

driver_info as (
    select 
    driver_id,
    full_name,
    driver_code,
    driver_nationality
    
    from source

)
select * from driver_info