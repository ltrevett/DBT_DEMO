select

    started_at,
    date(started_at) as date_started_at,
    hour(started_at) as hour_started_at,

    case when dayname(started_at) in ('Sat','Sun')
        then 'WEEKEND'
    else
        'BUSINESSDAY'
    end as day_type,

    {{season('started_at')}} as season

from {{ source('demo', 'bikes') }}