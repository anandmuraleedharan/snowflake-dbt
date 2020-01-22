{{ config(materialized='table') }}

with source_data as (

    select
    t.$1 as rowid,
    t.$2 as orderid,
    t.$3 as OrderDate,
    t.$4 as ShipDate,
    t.$5 as ShipModeCustomerID,
    t.$6 as CustomerName,
    t.$7 as Segment,
    t.$8 as City,
    t.$9 as State,
    t.$10 as Country,
    t.$11 as PostalCodeMarket,
    t.$12 as Region,
    t.$13 as ProductID,
    t.$14 as Category,
    t.$15 as SubCategory,
    t.$16 as ProductName,
    t.$17 as Sales,
    t.$18 as Quantity,
    t.$19 as Discount,
    t.$20 as Profit,
    t.$21 as ShippingCost,
    t.$22 as OrderPriority

    from @my_s3_stage/ t

)

select * from source_data
