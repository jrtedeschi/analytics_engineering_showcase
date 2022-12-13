with
    final as (

        select
            cast(id as int64) as company_id,
            cast(name as string) as company_name,
            case
                when regexp_contains(country, r'^[Bb][Rr][Aa]?') = true
                then "BRA"
                when regexp_contains(country, r'^[Mm][EÉée][Xx]|[Mm][Xx]') = true
                then "MEX"
                when regexp_contains(country, r'^[Cc][Oo][Ll]?') = true
                then "COL"
            end as country_code,
        from {{ source("raw", "companies") }}
    )

select *
from final
