WITH funnel AS (

SELECT

user_pseudo_id,

MAX(CASE 
WHEN event_name='page_view'
THEN 1 ELSE 0 END) AS visit,

MAX(CASE 
WHEN event_name='view_item'
THEN 1 ELSE 0 END) AS view_product,

MAX(CASE 
WHEN event_name='add_to_cart'
THEN 1 ELSE 0 END) AS add_cart,

MAX(CASE 
WHEN event_name='begin_checkout'
THEN 1 ELSE 0 END) AS checkout,

MAX(CASE 
WHEN event_name='purchase'
THEN 1 ELSE 0 END) AS purchase


FROM
`bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`

GROUP BY user_pseudo_id

)


SELECT

SUM(visit) AS visitors,

SUM(view_product) AS product_views,

SUM(add_cart) AS carts,

SUM(checkout) AS checkouts,

SUM(purchase) AS purchases,


ROUND(
SAFE_DIVIDE(SUM(view_product),SUM(visit))*100
,2) AS visit_to_view_rate,


ROUND(
SAFE_DIVIDE(SUM(add_cart),SUM(view_product))*100
,2) AS view_to_cart_rate,


ROUND(
SAFE_DIVIDE(SUM(checkout),SUM(add_cart))*100
,2) AS cart_to_checkout_rate,


ROUND(
SAFE_DIVIDE(SUM(purchase),SUM(checkout))*100
,2) AS checkout_to_purchase_rate,


ROUND(
SAFE_DIVIDE(SUM(purchase),SUM(visit))*100
,2) AS overall_conversion_rate


FROM funnel;