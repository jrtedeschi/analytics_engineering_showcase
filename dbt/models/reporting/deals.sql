
with
    deals as (
        select
            *
        from {{ ref('stg_deals')}}
    ),


comp_assoc as (
    select deal_id, company_id
    from {{ref('companies_deals_associations')}}
),
contact_assoc as (
    select deal_id, contact_id
    from {{ref('contacts_deals_associations')}}
),

final as (
    select 
    *
    from deals
    left join comp_assoc using(deal_id)
    left join contact_assoc using(deal_id)
)

select * from final