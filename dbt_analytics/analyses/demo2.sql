with base as
(

    select * from
    {{ref('silver_clean_emp_hr_lookup_data')}}
)
select 
employeenumber,
monthlyincome,
{{income_band('monthlyincome')}} as income_band
from base