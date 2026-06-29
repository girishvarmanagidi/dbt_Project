select a.employee_number from {{ref("silver_clean_emp_hr_lookup_data")}} as a
join
{{ref("silver_emp_hr_quarantine_data")}} as q
on a.employee_number = q.employee_number