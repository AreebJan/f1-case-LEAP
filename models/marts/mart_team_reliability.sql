with

races as (
    select * from {{ ref('stg_races') }}
),

results_classified as (
    select * from {{ref('int_results_classified')}}
),


joined as (
    select 
    races.season,
    results_classified.constructor_id,
    results_classified.status_category

    from results_classified
    join races 
    on 
    results_classified.race_id = races.race_id

    where season >= 2011


),

aggregated as (
    select
        season,
        constructor_id,
        count(*)                                               as race_entries,
        count_if(status_category = 'mechanical')               as mechanical_retirements,
        count_if(status_category = 'mechanical') / count(*)    as mechanical_retirement_rate
    from joined
    group by season, constructor_id
)

select * from aggregated