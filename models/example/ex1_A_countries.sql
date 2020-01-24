
{{ config(materialized='view') }}

with source_data as (

    select *
    from raw.public.countries
    where country like 'A%'

)

select * from source_data
