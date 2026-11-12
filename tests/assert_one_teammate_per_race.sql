select
    race_id,
    driver_1_id,
    count(*) as teammates_in_race
from {{ ref('fct_teammate_races') }}
group by race_id, driver_1_id
having count(*) > 1
