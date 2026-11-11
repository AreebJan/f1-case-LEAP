
with 
source as (
    select * from {{source('f1', 'pit_stops')}}
    
),
renamed as (
    select 
    raceId as race_id,
    driverId as driver_id,
    stop as pit_stop_number,
    lap as lap_number,
    time as time_of_pit_stop,
    milliseconds as pit_stop_time_milliseconds

    from source

    )
select * from renamed

