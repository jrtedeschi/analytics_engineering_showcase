with final as (
    select * from {{ref("stg_owners")}}
)

select * from final