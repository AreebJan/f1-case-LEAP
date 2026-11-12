with

source as (
    select * from {{ source('f1', 'qualifying') }}
),

renamed as (
    select
        qualifyid as qualify_id,
        raceid as race_id,
        driverid as driver_id,
        constructorid as constructor_id,
        number as car_number,
        position as qualifying_final_position,
        try_to_number(split_part(q1, ':', 1)) * 60 + try_to_decimal(split_part(q1, ':', 2), 10, 3) as q1_seconds,
        try_to_number(split_part(q2, ':', 1)) * 60 + try_to_decimal(split_part(q2, ':', 2), 10, 3) as q2_seconds,
        try_to_number(split_part(q3, ':', 1)) * 60 + try_to_decimal(split_part(q3, ':', 2), 10, 3) as q3_seconds
    from source
)

select * from renamed