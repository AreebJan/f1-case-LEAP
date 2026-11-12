with

teammate_pairs as (
    select * from {{ ref('int_teammate_pairs') }}
),

qualifying_pairs as (
    select * from {{ ref('int_qualifying_pairs') }}
),

races as (
    select * from {{ ref('stg_races') }}
),

race_pairs as (
    select
        teammate_pairs.*,
        teammate_pairs.driver_1_is_classified_finish
            and teammate_pairs.driver_2_is_classified_finish as is_comparable_race,
        teammate_pairs.driver_1_final_rank < teammate_pairs.driver_2_final_rank as driver_1_finished_ahead
    from teammate_pairs
),

qualifying_compared as (
    select
        qualifying_pairs.*,
        case
            when driver_1_q3_seconds is not null and driver_2_q3_seconds is not null
                then (driver_1_q3_seconds - driver_2_q3_seconds) / driver_2_q3_seconds
            when driver_1_q2_seconds is not null and driver_2_q2_seconds is not null
                then (driver_1_q2_seconds - driver_2_q2_seconds) / driver_2_q2_seconds
            when driver_1_q1_seconds is not null and driver_2_q1_seconds is not null
                then (driver_1_q1_seconds - driver_2_q1_seconds) / driver_2_q1_seconds
        end * 100 as qualifying_gap_pct,
        qualifying_pairs.driver_1_qualifying_final_position
            < qualifying_pairs.driver_2_qualifying_final_position as driver_1_qualified_ahead
    from qualifying_pairs
),

joined as (
    select
        races.season,
        race_pairs.race_id,
        race_pairs.constructor_id,
        race_pairs.driver_1_id,
        race_pairs.driver_2_id,
        race_pairs.driver_1_final_rank,
        race_pairs.driver_2_final_rank,
        race_pairs.is_comparable_race,
        race_pairs.driver_1_finished_ahead,
        qualifying_compared.driver_1_qualified_ahead,
        qualifying_compared.qualifying_gap_pct
    from race_pairs
    left join qualifying_compared
        on  race_pairs.driver_1_id = qualifying_compared.driver_1_id
        and race_pairs.driver_2_id = qualifying_compared.driver_2_id
        and race_pairs.race_id = qualifying_compared.race_id
    join races
        on race_pairs.race_id = races.race_id
    where races.season >= 2011
)

select * from joined