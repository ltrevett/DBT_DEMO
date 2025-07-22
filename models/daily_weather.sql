with daily_weather as (


select

    date(time) as date,
    weather,
    clouds,
    humidity,
    pressure,
    temp

from {{ source('demo', 'weather') }}

),

most_popular_weather as (

    select

        date,
        weather

    from daily_weather

    group by date, weather

    qualify row_number() over(partition by date order by count(weather) desc) = 1

),

daily_weather_agg as (

    select

        d.date,
        w.weather,
        round(avg(d.clouds),2) as clouds,
        round(avg(d.humidity),2) as humidity,
        round(avg(d.temp),2) as temp,
        round(avg(d.pressure),2) as pressure,

    from daily_weather d

    left join most_popular_weather w
    on w.date = d.date

    group by d.date, w.weather

)

select * from daily_weather_agg