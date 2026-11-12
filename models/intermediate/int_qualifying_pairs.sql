with

qualifying as (
    select * from {{ ref('stg_qualifying') }}
),

qualifying_pairs as (
    select
        driver.race_id,
        driver.constructor_id,

        driver.driver_id as driver_1_id,
        driver.qualifying_final_position as driver_1_qualifying_final_position,
        driver.q1_seconds as driver_1_q1_seconds,
        driver.q2_seconds as driver_1_q2_seconds,
        driver.q3_seconds as driver_1_q3_seconds,

        teammate.driver_id as driver_2_id,
        teammate.qualifying_final_position as driver_2_qualifying_final_position,
        teammate.q1_seconds as driver_2_q1_seconds,
        teammate.q2_seconds as driver_2_q2_seconds,
        teammate.q3_seconds as driver_2_q3_seconds
    from qualifying as driver
    join qualifying as teammate
        on  driver.race_id = teammate.race_id
        and driver.constructor_id = teammate.constructor_id
        and driver.driver_id != teammate.driver_id
)

select * from qualifying_pairs