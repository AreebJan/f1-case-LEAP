
with 
source as (
    select * from {{source('f1', 'qualifying')}}
    
),
renamed as (
    select 
    qualifyId as qualify_id,
    raceId as race_id,
    driverId as driver_id,
    constructorId as constructor_id,
    number as car_number,
    position as qualifying_final_position,
    TRY_TO_NUMBER(split_part(q1, ':',1))  * 60 + TRY_TO_DECIMAL(split_part(q1, ':',2), 10, 3) as q1_seconds,
    TRY_TO_NUMBER(split_part(q2, ':',1))  * 60 + TRY_TO_DECIMAL(split_part(q2, ':',2), 10, 3) as q2_seconds,
    TRY_TO_NUMBER(split_part(q3, ':',1))  * 60 + TRY_TO_DECIMAL(split_part(q3, ':',2), 10, 3) as q3_seconds
    
    from source

    )
select * from renamed