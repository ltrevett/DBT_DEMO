select

    started_at,
    date(started_at) as date_started_at,
    hour(started_at) as hour_started_at,

    case when dayname(started_at) in ('Sat','Sun')
        then 'WEEKEND'
    else
        'BUSINESSDAY'
    end as day_type,

    case when month(started_at) in (12,1,2)
        then 'WINTER'
    when month(started_at) in (3,4,5)
        then 'SPRING'
    when month(started_at) in (6,7,8)
        then 'SUMMER'
    when month(started_at) in (9,10,11)
        then 'AUTUMN'
    end as season

from {{ source('demo', 'bikes') }}