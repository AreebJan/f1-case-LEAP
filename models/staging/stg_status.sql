with

source as (
    select * from {{ source('f1', 'status') }}
),

renamed as (
    select
        statusid as status_id,
        status as result_status
    from source
)

select * from renamed