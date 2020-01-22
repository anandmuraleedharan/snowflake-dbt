{{ config(materialized='table') }}

with source_data as (

  select *
  from revperyear
  where year = '{{ var("year") }}'

)

select * from source_data
