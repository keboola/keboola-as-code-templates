create or replace table "analyze_clv_by_time_from_previous_order" as
with previous_order_category as (
select o.ORDER_ID,
       datediff(day,
                lag(o.ORDER_DATE) over (partition by o.ORDER_CUSTOMER_EMAIL order by o.ORDER_DATE),
                o.ORDER_DATE
               ) as diff,
       case when diff > 90 then '110_Q+ since previous order'
            when diff > 60 then '100_2M-Q since previous order'
            when diff > 30 then '090_1M-2M since previous order'
            when diff >  7 then '080_7D-1M since previous order'
            when diff >  6 then '070_7D since previous order'
            when diff >  5 then '060_6D since previous order'
            when diff >  4 then '050_5D since previous order'
            when diff >  3 then '040_4D since previous order'
            when diff >  2 then '030_3D since previous order'
            when diff >  1 then '020_2D since previous order'
            when diff >  0 then '010_1D since previous order'
            ELSE 'N/A'
        end as previous_order,
       (select count(1) from "bdm_orders" io where io.ORDER_CUSTOMER_EMAIL = o.ORDER_CUSTOMER_EMAIL) order_count,
       ORDER_CUSTOMER_EMAIL,
       ORDER_TOTAL_PRICE_WITH_WAT as ORDER_TOTAL_PRICE_VAT
from "bdm_orders" o
where ORDER_CUSTOMER_EMAIL <> '')

select
       previous_order time_from_previous_order
     , count(1) orders
     , count(distinct ORDER_CUSTOMER_EMAIL) unique_cutomers
     , sum(ORDER_TOTAL_PRICE_VAT) / count(distinct ORDER_CUSTOMER_EMAIL) AVG_CLV
     , sum(ORDER_TOTAL_PRICE_VAT) ORDER_TOTAL_PRICE_VAT
     , avg(ORDER_TOTAL_PRICE_VAT) AVG_ORDER_PRICE
from previous_order_category
group by previous_order
order by previous_order;
