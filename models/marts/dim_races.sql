with

source as (
    select * from {{ ref('stg_races') }}
),

races_info as (
    select 
    season,
    race_id,
    race_name,
    race_date,
    race_number_in_season
    
    from source

)
select * from races_info