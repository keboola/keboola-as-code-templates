create table "bdm_product_margin_over_time" as
select ORDER_DATE::date ORDER_DATE
     , ORDER_LINE_PRODUCT_ID PRODUCT_ID
     , avg((ORDER_LINE_PRICE_WITH_VAT - LINE_PURCHASE_PRICE)/ORDER_LINE_AMOUNT) AVG_ORDER_LINE_MARGIN
from "bdm_order_lines"
where ORDER_LINE_PRICE_WITH_VAT - LINE_PURCHASE_PRICE <> 0
group by 1,2
order by ORDER_DATE, PRODUCT_ID;
