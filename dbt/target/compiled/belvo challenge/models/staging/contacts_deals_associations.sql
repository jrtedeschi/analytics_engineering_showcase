with
    associations as (select * from `dbtlab-371120`.`raw_belvo_challenge`.`contacts_deals_associations`),
    final as (
        select cast(deal_id as int64) as deal_id, cast(contactid as int64) as contact_id
        from associations
        cross join unnest(json_extract_array(associations.dealids)) deal_id
    )
select *
from final