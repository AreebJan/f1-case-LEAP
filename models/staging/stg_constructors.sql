with

source as (
    select * from {{ source('f1', 'constructors') }}
),

renamed as (
    select
        constructorid as constructor_id,
        constructorref as constructor_ref,
        name as constructor_name,
        nationality as constructor_nationality
    from source
)

select * from renamed