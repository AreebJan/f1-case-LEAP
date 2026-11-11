
with 
source as (
    select * from {{source('f1', 'lap_times')}}
    
),
renamed as (
    select 
    raceId as race_id,
    driverId as driver_id,
    lap as lap_number,
    position as lap_position,
    milliseconds as lap_time_milliseconds

    from source

    )
select * from renamed

