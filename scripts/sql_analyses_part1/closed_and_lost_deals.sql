with amounts as (
select 
  c.country_code,
  d.product_name, 
  d.deal_status, 
  sum(d.deal_amount) amount, 
  count(deal_id) as deals
from belvo_challenge.deals as d
left join `dbtlab-371120.belvo_challenge.companies` as c using(company_id)
group by 1,2,3),

amnt_pivoted as (
select * from amounts
  pivot(sum(amount) amount,sum(deals) deals for deal_status in ('Closed', 'Lost'))
)

select  
*,
round(deals_Closed/(deals_Closed+deals_Lost),2) close_rate,
(amount_Closed + amount_Lost) amount_Total,
(deals_Closed+deals_Lost) deals_Total,
round(amount_Closed/deals_Closed,2) as avg_ticket_Closed,
round(amount_Lost/deals_Lost,2) as avg_ticket_Lost,

 FROM amnt_pivoted

 order by country_code
;