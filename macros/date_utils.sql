{% macro season(x) %}

case when month({{x}}) in (12,1,2) 
    then 'WINTER'
when month({{x}}) in (3,4,5)
    then 'SPRING'
when month({{x}}) in (6,7,8)
    then 'SUMMER'
when month({{x}}) in (9,10,11)
    then 'AUTUMN'
end

{% endmacro %}