select 
-- from raw order
o.ORDERID,
o.ORDERDATE,
o.SHIPDATE,
o.SHIPMODE,
o.ORDERSELLINGPRICE - o.ORDERCOSTPRICE as order_profit,
o.ORDERSELLINGPRICE,
o.ORDERCOSTPRICE,
-- from raw customer
c.CUSTOMERID,
c.CUSTOMERNAME,
c.SEGMENT,
c.COUNTRY,
-- from raw product
p.PRODUCTID,
p.CATEGORY,
p.PRODUCTNAME,
p.SUBCATEGORY,
{{ markup() }} as mk
from
{{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
on o.CUSTOMERID = c.CUSTOMERID
left join {{ ref('raw_product') }} as p
on o.productid = p.PRODUCTID