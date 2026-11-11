with

source as (
    select * from {{ ref('stg_constructors') }}
),

constructor_info as (
    select 
    constructor_id,
    constructor_name,
    constructor_nationality
    
    from source

)
select * from constructor_info