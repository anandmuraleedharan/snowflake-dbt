{{ config(materialized='table') }}

with source_data as (

  select *
  from raw.public.revperyear
  where year = '{{ var("year") }}'

)

select * from source_data
