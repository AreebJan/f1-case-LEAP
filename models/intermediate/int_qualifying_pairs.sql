with 

qualifying as (
    select * from {{ref('stg_qualifying')}}

),

qualifying_pairs as (
    select
        d.race_id,
        d.constructor_id,

        d.driver_id as driver_1_id,
        d.qualifying_final_position as driver_1_qualifying_final_position,
        d.q1_seconds as driver_1_q1_seconds,
        d.q2_seconds as driver_1_q2_seconds,
        d.q3_seconds as driver_1_q3_seconds,

        t.driver_id as driver_2_id,
        t.qualifying_final_position as driver_2_qualifying_final_position,
        t.q1_seconds as driver_2_q1_seconds,
        t.q2_seconds as driver_2_q2_seconds,
        t.q3_seconds as driver_2_q3_seconds

    from qualifying as d
    join qualifying as t
        on  d.race_id = t.race_id 
        and d.constructor_id = t.constructor_id
        and d.driver_id != t.driver_id
)

select * from qualifying_pairs