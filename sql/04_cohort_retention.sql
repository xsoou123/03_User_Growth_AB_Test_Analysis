WITH user_first_date AS (

SELECT

user_pseudo_id,

MIN(DATE(TIMESTAMP_MICROS(event_timestamp))) AS first_date

FROM
`bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`

GROUP BY
user_pseudo_id

),


user_activity AS (

SELECT

DISTINCT

e.user_pseudo_id,

DATE(TIMESTAMP_MICROS(e.event_timestamp)) AS activity_date,

u.first_date

FROM
`bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*` e


JOIN user_first_date u

ON e.user_pseudo_id = u.user_pseudo_id

),


cohort_data AS (

SELECT


first_date,


activity_date,


DATE_DIFF(
activity_date,
first_date,
MONTH
) AS month_number,


COUNT(DISTINCT user_pseudo_id) AS users


FROM user_activity


GROUP BY

first_date,

activity_date,

month_number

)


SELECT


FORMAT_DATE('%Y-%m', first_date) AS cohort_month,


month_number,


users,


ROUND(

users /

FIRST_VALUE(users) OVER(

PARTITION BY first_date

ORDER BY month_number

)

*100

,2)

AS retention_rate


FROM cohort_data


ORDER BY

cohort_month,

month_number;