with
    final as (
        select
            cast(id as int64) as owner_id,
            cast(name as string) as owner_name,
            cast(team as string) as owner_team,
            cast(job_position as string) as owner_position,

        from `dbtlab-371120`.`raw_belvo_challenge`.`owners`
    )

select *
from final