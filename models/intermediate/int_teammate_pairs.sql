with 

results as (
    select * from {{ref('int_results_classified')}}

),

teammate_pairs as (
    select
        d.race_id,
        d.constructor_id,
        d.driver_id as driver_1_id,
        d.final_position as driver_1_final_position,
        d.status_id as driver_1_status_id,
        d.final_rank as driver_1_final_rank,
        d.is_classified_finish as driver_1_is_classified_finish,

        t.driver_id as driver_2_id,
        t.final_position as driver_2_final_position,
        t.status_id as driver_2_status_id,
        t.final_rank as driver_2_final_rank,
        t.is_classified_finish as driver_2_is_classified_finish


    from results as d
    join results as t
        on  d.race_id = t.race_id 
        and d.constructor_id = t.constructor_id
        and d.driver_id != t.driver_id
)



select * from teammate_pairs