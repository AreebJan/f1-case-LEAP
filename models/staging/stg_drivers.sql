
with 
source as (
    select * from {{source('f1', 'drivers')}}
    
),
renamed as (
    select 
    driverId as driver_id,
    driverRef as driver_ref,
    number as driver_number,
    code as driver_code,
    forename as first_name,
    surname as last_name,
    forename || ' ' || surname as full_name,
    dob as date_of_birth,
    nationality as driver_nationality

    from source


    )
select * from renamed