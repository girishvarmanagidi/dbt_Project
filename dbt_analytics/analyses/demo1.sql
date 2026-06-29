{% set Genders =['Male', 'Female', 'Other'] %}
with base as
(
    select * from
{{ref('bronze_emp_data') }}
)
select 

{% for gender in Genders %}
sum(case when gender='{{gender}}' then 1 else 0 end)as {{gender | lower}}_count{% if not loop.last %},{% endif %}
{% endfor %}
from base
--   sum(case when gender='Male' then 1 else 0 end)as male_count,
--   sum(case when gender='Female' then 1 else 0 end)as female_count,
--   sum(case when gender='Other' then 1 else 0 end)as others_count
-- from base
