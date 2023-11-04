select
CUSTOMERID,
CUSTOMERNAME,
SEGMENT,
COUNTRY,
sum(order_profit) as profit
from {{ ref("stg_orders") }}
group by
CUSTOMERID,
CUSTOMERNAME,
SEGMENT,
COUNTRY