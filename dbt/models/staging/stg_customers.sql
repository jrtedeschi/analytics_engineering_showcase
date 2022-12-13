with
    final as (

        select
            cast(id as int64) as customer_id,
            cast(customer_phase as string) as customer_phase,
            cast(owner_id as int64) as owner_id,
            date(timestamp_seconds(cast(start_date as int64))) as customer_start_date,
            date(end_date) as customer_end_date
        from {{source("raw","customers")}}

        where start_date is not null
    )

select *
from final
