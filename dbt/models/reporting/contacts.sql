with final as (
    select * from {{ref("stg_contacts")}}
)

select * from final