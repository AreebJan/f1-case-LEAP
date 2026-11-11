with 

results as (
    select * from {{ref('stg_results')}}

),

categories_classified as (
    select * from {{ref('status_categories')}}
),

results_classified as (
    select results.*,
    status_category,
    status_category IN('finished', 'lapped') as is_classified_finish

    from results

    LEFT JOIN categories_classified
    on
    results.status_id = categories_classified.status_id
)

select * from results_classified