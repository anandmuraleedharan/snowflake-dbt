{{ config(materialized='table') }}

with

t1 as (
  select min(to_date('01' || '/' || monthyear)) as pcm_start, max(to_date('01' || '/' || monthyear)) as pcm_end
  from pricechangemarker
),

t2 as (
  select '{{ var("prod") }}' as product,
         a.price as price,
         b.my_month_year as monthyear
  from pricechangemarker as a
  right outer join date_time_dimension as b
  on a.monthyear = b.my_month_year
),

source_data as (

  select product,
         case
              when t2.price is not null then t2.price
              else lag(t2.price) ignore nulls over (order by to_date('01' || '/' || monthyear))
         end as price,
         monthyear
  from t2, t1
  where to_date('01' || '/' || monthyear) >= t1.pcm_start and
  to_date('01' || '/' || monthyear) <= t1.pcm_end

)

select * from source_data
