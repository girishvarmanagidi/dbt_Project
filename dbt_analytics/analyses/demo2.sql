with base as
(

    select * from
    {{ref('silver_clean_emp_hr_lookup_data')}}
)
select 
employee_number,
monthly_income,
{{income_band('monthly_income')}} as income_band
from base