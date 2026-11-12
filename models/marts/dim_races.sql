with

races as (
    select * from {{ ref('stg_races') }}
),

final as (
    select
        race_id,
        season,
        race_name,
        race_date,
        race_number_in_season
    from races
)

select * from final