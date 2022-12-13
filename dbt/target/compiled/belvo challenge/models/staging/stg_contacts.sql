with
    final as (
        select
            cast(id as int64) as contact_id,
            cast(name as string) as contact_name,
            cast(job as string) as contact_job,
            case
                when regexp_contains(country, r'^[Bb][Rr][Aa]?') = true
                then "BRA"
                when regexp_contains(country, r'^[Mm][EÉée][Xx]|[Mm][Xx]') = true
                then "MEX"
                when regexp_contains(country, r'^[Cc][Oo][Ll]?') = true
                then "COL"
            end as country_code,

        from `dbtlab-371120`.`raw_belvo_challenge`.`contacts`
    )

select *
from final