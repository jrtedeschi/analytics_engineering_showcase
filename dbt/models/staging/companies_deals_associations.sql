with
    associations as (select * from {{ source("raw", "companies_deals_associations") }}),
    final as (
        select cast(deal_id as int64) as deal_id, cast(companyid as int64) as company_id
        from associations
        cross join unnest(json_extract_array(associations.dealids)) deal_id
    )
select *
from final
