
with 
source as (
    select * from {{source('f1', 'circuits')}}
    
),
renamed as (
    select 
    circuitId as circuit_id,
    circuitRef as circuit_ref,
    name as circuit_name,
    location,
    country


    from source

    )
select * from renamed

