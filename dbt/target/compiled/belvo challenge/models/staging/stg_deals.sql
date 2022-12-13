with
    final as (
        select
            cast(id as int64) as deal_id,
            cast(externalid as int64) as deal_external_id,
            cast(ownerid as int64) as owner_id,
            split(cast(name as string), " - ")[offset(0)] as deal_customer_name,
            split(cast(name as string), " - ")[offset(1)] as deal_type,
            cast(product as string) as product_name,
            cast(amount as float64) as deal_amount,
            cast(closed as bool) as deal_closed,
            cast(status as string) as deal_status,
            date(created_date) as deal_created_date

        from `dbtlab-371120`.`raw_belvo_challenge`.`deals`
    )

select * from final