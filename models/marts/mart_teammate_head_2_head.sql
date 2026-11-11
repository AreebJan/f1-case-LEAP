with

teammate_races as (
    select * from {{ ref('fct_teammate_races') }}
),

aggregated as (
    select
        season,
        constructor_id,
        driver_1_id,
        driver_2_id,
        count(*)                                                  as races_together,
        count_if(is_comparable_race)                              as comparable_races,
        count_if(is_comparable_race and driver_1_finished_ahead)  as races_ahead_of_teammate,
        count(driver_1_qualified_ahead)                           as qualifying_sessions_together,
        count_if(driver_1_qualified_ahead)                        as qualifying_ahead_of_teammate,
        median(qualifying_gap_pct)                                as median_qualifying_gap_pct
    from teammate_races
    where season >= 2011
    group by season, constructor_id, driver_1_id, driver_2_id
)

select * from aggregated