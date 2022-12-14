with covid_data as (
  select 
    date_trunc(date,week) as weekstart,
    extract(year from date) as year,
    country_region as country_name,
    sum(confirmed) confirmed_cases,
    sum(deaths) deaths,
    sum(cast(recovered as int64)) recovered
  from `bigquery-public-data.covid19_jhu_csse.summary`
  group by 1,2,3
  ),

 census_data as (
   select 
    country_name, 
    midyear_population as population,
    year
   from `bigquery-public-data.census_bureau_international.midyear_population`
   where year in (2020,2021,2022)
 ),

 combined as (
  select
    country_name,
    weekstart,
    year,
    population,
    deaths,
    recovered,
    confirmed_cases,
    confirmed_cases/population as cases_per_capita
  from covid_data
  left join census_data using (country_name, year)

 ),

 final as (

 select 
  *,
  safe_divide(deaths,confirmed_cases) as death_rate,
  ifnull(lag(cases_per_capita) over w1,0) as lw_count,
  safe_divide(cases_per_capita, ifnull(lag(cases_per_capita) over w1,0)) -1 as wow_growth,
  ifnull(lag(confirmed_cases) over w1,0) as lw_confirmed_cases,
  log10(population) as log_population


 from combined
 where country_name is not null
 window w1 as (partition by country_name order by weekstart)
 )

 select * from final where population is not null and confirmed_cases is not null;


with covid_data as (
  select 
    date,
    country_region,
    sum(confirmed) confirmed_cases,
    sum(deaths) deaths,
    sum(cast(recovered as int64)) recovered
  from `bigquery-public-data.covid19_jhu_csse.summary`
  group by 1,2
  )

  select *, row_number() over (partition by country_region order by date desc) as last_date
  from covid_data
  qualify last_date = 1

