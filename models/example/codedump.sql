with t1 as (
select a.my_month_year as dtd_monthyear, max(to_date('01' || '/' || b.monthyear, 'dd/mm/yyyy')) as pcm_monthyear from "STANDARD"."PUBLIC"."DATE_TIME_DIMENSION" as a
JOIN "RAW"."PUBLIC"."PRICECHANGEMARKER" b
ON b.monthyear <= a.my_month_year
GROUP BY a.my_month_year
)

select pcm.product, pcm.price, to_date('01' || '/' || t1.dtd_monthyear, 'dd/mm/yyyy')
from "RAW"."PUBLIC"."PRICECHANGEMARKER" as pcm
join t1 on to_date('01' || '/' || pcm.monthyear, 'dd/mm/yyyy') = t1.pcm_monthyear
order by price
