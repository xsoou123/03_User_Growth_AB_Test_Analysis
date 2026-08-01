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

GROUP BY
user_pseudo_id

)

SELECT

COUNT(*) AS total_users,

SUM(visit) AS visitors,

SUM(view_product) AS product_view_users,

SUM(add_cart) AS cart_users,

SUM(checkout) AS checkout_users,

SUM(purchase) AS purchasers

FROM funnel;