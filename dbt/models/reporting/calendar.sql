{{ config(
    materialized='view')}}


with final as (
SELECT
  date,
  EXTRACT(ISOWEEK FROM date) AS isoweek,
  DATE_TRUNC(DATE,MONTH) AS month_start,
  LAST_DAY(DATE, MONTH) AS month_end,
  EXTRACT(month FROM date) AS month,
  EXTRACT(quarter FROM date) AS quarter,
  EXTRACT(YEAR FROM date) AS year,
FROM UNNEST(GENERATE_DATE_ARRAY('2020-01-01', '2030-01-01')) AS date
ORDER BY date

)

select * from final 