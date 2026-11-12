with

results as (
    select * from {{ ref('stg_results') }}
),

status_categories as (
    select * from {{ ref('status_categories') }}
),

results_classified as (
    select
        results.*,
        status_categories.status_category,
        status_categories.status_category in ('finished', 'lapped') as is_classified_finish
    from results
    left join status_categories
        on results.status_id = status_categories.status_id
)

select * from results_classified