with base as
(
    select 
    age,
    attrition,
    business_travel,
    dailyrate,
    department,
    distancefromhome,
    education,
    educationfield,
    employeecount,
    employeenumber,
    environmentsatisfaction,
    gender,
    hourlyrate,
    jobinvolvement,
    joblevel,
    jobrole,
    jobsatisfaction,
    maritalstatus,
    monthlyincome,
    monthlyrate,
    numcompaniesworked,
    over18,
    overtime,
    percentsalaryhike,
    performancerating,
    relationshipsatisfaction,
    standardhours,
    stockoptionlevel,
    totalworkingyears,
    trainingtimeslastyear,
    worklifebalance,
    yearsatcompany,
    yearsincurrentrole,
    yearssincelastpromotion,
    yearswithcurrmanager,
    cast(created_at as date) as created_at
    from {{ref('bronze_emp_data')}}
),
final as
(
    select 
        b.age as age,
        b.attrition as attrition,	
        b.business_travel as business_travel,	
        b.dailyrate as daily_rate,
        b.department as department,
        b.distancefromhome as distance_from_home,
        el.Education_Value as education_value,
        b.education as education,
        b.educationfield as education_field,
        b.employeenumber as employee_number,
        b.environmentsatisfaction as environment_satisfaction,
        esl.Environment_Satisfaction_Value as environment_satisfaction_value,
        b.gender as gender,
        b.hourlyrate as hourly_rate,
        jil.Job_Involvement_Value as job_involvement_value,
        b.jobinvolvement as job_involvement,
        jll.Job_Level_Value as job_level_value,
        b.joblevel as job_level,
        b.jobrole as job_role,
        b.jobsatisfaction as job_satisfaction,
        jsl.Job_Satisfaction_Value as job_satisfaction_value,
        b.maritalstatus as marital_status,
        b.monthlyincome as monthly_income,
        b.monthlyrate as monthly_rate,
        b.numcompaniesworked as num_companies_worked,
        b.overtime as overtime,
        b.percentsalaryhike as percent_salary_hike,	
        b.performancerating as performance_rating,
        prl.Performance_Rating_Value as performance_rating_value,	
        b.relationshipsatisfaction as relationship_satisfaction,
        rsl.Relationship_Satisfaction_Value as relationship_satisfaction_value,
        b.standardhours as standard_hours,
        b.stockoptionlevel as stock_option_level,
        b.totalworkingyears as total_working_years,	
        b.trainingtimeslastyear as training_times_last_year,
        b.worklifebalance as work_life_balance,
        b.yearsatcompany as years_at_company,
        b.yearsincurrentrole as years_in_current_role,
        b.yearssincelastpromotion as years_since_last_promotion,
        b.yearswithcurrmanager as years_with_current_manager,
        b.created_at as created_at
    from base b 
    left join {{ ref("Education_Lookup")}} el
    on b.education = el.Education_Level
    left join {{ ref('Job_Involvement_Lookup') }} as jil 
    on b.jobinvolvement = jil.Job_Involvement_Level
    left join {{ ref('Job_Level_Lookup') }} as jll 
    on b.joblevel = jll.Job_Level
    left join {{ ref('Job_Satisfaction_Lookup') }} as jsl 
    on b.jobsatisfaction = jsl.Job_Satisfaction_Level 
    left join {{ ref('Performance_Rating_Lookup') }} as prl 
    on b.performancerating = prl.Performance_Rating_Level
    left join {{ ref('Relationship_Satisfaction_Lookup') }} as rsl 
    on b.relationshipsatisfaction = rsl.Relationship_Satisfaction_Level
    left join {{ ref('Work_Life_Balance_Lookup') }} as wlbl 
    on b.worklifebalance = wlbl.Work_Life_Balance
    left join {{ ref('Environment_Satisfaction_Lookup') }} as esl 
    on b.environmentsatisfaction = esl.Environment_Satisfaction_Level
)
select * 
from final
where created_at is not null