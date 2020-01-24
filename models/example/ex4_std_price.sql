{{ config(materialized='table') }}

with source_data as (

  select a.product, a.price, b.my_month_year as monthyear
  from raw.public.pricechangemarker as a
  right outer join standard.public.date_time_dimension as b
  on a.monthyear = b.my_month_year

)

select * from source_data where product is not null
