
with 
source as (
    select * from {{source('f1', 'results')}}
    
),
renamed as (
    select 
        resultid as result_id,
        raceid as race_id,
        driverid as driver_id,
        constructorid as constructor_id,
        number as car_number,
        NULLIF(grid,0) as starting_position,
        position as final_position, 
        positionORder as final_rank,
        points as points,
        laps as race_laps,
        milliseconds as race_time_milliseconds,
        fastestLap as fastest_lap_number,
        rank as fastest_lap_rank,
        fastestLapTime as fastest_lap_time,
        fastestLapSpeed as fastest_lap_speed,
        statusId as status_id
    
    from source


    )
select * from renamed