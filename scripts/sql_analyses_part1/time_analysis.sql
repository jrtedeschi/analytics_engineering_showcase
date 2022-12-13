with amounts as (
select 
  c.country_code,
  date_trunc(d.deal_created_date, month) as month,
  product_name,
  sum(d.deal_amount) amount, 
  count(deal_id) as deals,
  round(sum(d.deal_amount)/count(deal_id),2) avg_ticket
from belvo_challenge.deals as d
left join `dbtlab-371120.belvo_challenge.companies` as c using(company_id)
where deal_status = 'Closed'
group by 1,2,3),

amnt_pivoted as (
select * from amounts
  pivot(sum(amount) amount,sum(deals) deals, avg(avg_ticket) avg_ticket for country_code in ('BRA', 'MEX', 'COL'))
)

select * from amnt_pivoted
order by product_name, month