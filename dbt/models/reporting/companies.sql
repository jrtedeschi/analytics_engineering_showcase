with final as (
    select * from {{ref("stg_companies")}}
)

select * from final