
with amounts as (
select 
  c.country_code,
  product_name,
  sum(d.deal_amount) amount, 
  count(deal_id) as deals,
  round(sum(d.deal_amount)/count(deal_id),2) avg_ticket
from belvo_challenge.deals as d
left join `dbtlab-371120.belvo_challenge.companies` as c using(company_id)
where deal_status = 'Closed'
group by 1,2)

select 
    *, 
    sum(amount) over (partition by product_name) as product_revenue,
    amount/sum(amount) over (partition by product_name) product_revenue_share

from amounts
order by country_code, product_name



