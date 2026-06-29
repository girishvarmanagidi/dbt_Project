select * from {{ref("silver_clean_emp_hr_lookup_data")}} 
where created_at > current_date or
created_at < '2010-01-01'