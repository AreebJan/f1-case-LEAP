with

results as (
    select * from {{ ref('int_results_classified') }}
),

teammate_pairs as (
    select
        driver.race_id,
        driver.constructor_id,

        driver.driver_id as driver_1_id,
        driver.final_position as driver_1_final_position,
        driver.status_id as driver_1_status_id,
        driver.final_rank as driver_1_final_rank,
        driver.is_classified_finish as driver_1_is_classified_finish,

        teammate.driver_id as driver_2_id,
        teammate.final_position as driver_2_final_position,
        teammate.status_id as driver_2_status_id,
        teammate.final_rank as driver_2_final_rank,
        teammate.is_classified_finish as driver_2_is_classified_finish
    from results as driver
    join results as teammate
        on  driver.race_id = teammate.race_id
        and driver.constructor_id = teammate.constructor_id
        and driver.driver_id != teammate.driver_id
)

select * from teammate_pairs