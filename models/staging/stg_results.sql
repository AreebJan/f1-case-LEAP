with

source as (
    select * from {{ source('f1', 'results') }}
),

renamed as (
    select
        resultid as result_id,
        raceid as race_id,
        driverid as driver_id,
        constructorid as constructor_id,
        number as car_number,
        nullif(grid, 0) as starting_position,
        position as final_position,
        positionorder as final_rank,
        points,
        laps as race_laps,
        milliseconds as race_time_milliseconds,
        fastestlap as fastest_lap_number,
        rank as fastest_lap_rank,
        fastestlaptime as fastest_lap_time,
        fastestlapspeed as fastest_lap_speed,
        statusid as status_id
    from source
)

select * from renamed