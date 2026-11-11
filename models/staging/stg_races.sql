
with 
source as (
    select * from {{source('f1', 'races')}}
    
),
renamed as (
    select 
    raceId as race_id,
    year as season,
    round as race_number_in_season,
    circuitId as circuit_id,
    name as race_name,
    date as race_date,
    time as race_start_time

    from source


    )
select * from renamed