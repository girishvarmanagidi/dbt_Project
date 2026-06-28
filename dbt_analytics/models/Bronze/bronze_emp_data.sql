with  get_raw_cast_data as
(
select
    cast(age as int) as age,
    cast(attrition as boolean) as attrition,
    cast(businesstravel as varchar) as business_travel,
    cast(dailyrate as int) as dailyrate,
    cast(department as varchar) as department,
    cast(distancefromhome as int) as distancefromhome,
    cast(education as int) as education,
    cast(educationfield as varchar) as educationfield,
    cast(employeecount as int) as employeecount,
    cast(employeenumber as int) as employeenumber,
    cast(environmentsatisfaction as int) as environmentsatisfaction,
    cast(gender as varchar) as gender,
    cast(hourlyrate as int) as hourlyrate,
    cast(jobinvolvement as int) as jobinvolvement,
    cast(joblevel as int) as joblevel,
    cast(jobrole as varchar) as jobrole,
    cast(jobsatisfaction as int) as jobsatisfaction,
    cast(maritalstatus as varchar) as maritalstatus,
    cast(monthlyincome as int) as monthlyincome,
    cast(monthlyrate as int) as monthlyrate,
    cast(numcompaniesworked as int) as numcompaniesworked,
    cast(over18 as boolean) as over18,
    cast(overtime as boolean) as overtime,
    cast(percentsalaryhike as int) as percentsalaryhike,
    cast(performancerating as int) as performancerating,
    cast(relationshipsatisfaction as int) as relationshipsatisfaction,
    cast(standardhours as int) as standardhours,
    cast(stockoptionlevel as int) as stockoptionlevel,
    cast(totalworkingyears as int) as totalworkingyears,
    cast(trainingtimeslastyear as int) as trainingtimeslastyear,
    cast(worklifebalance as int) as worklifebalance,
    cast(yearsatcompany as int) as yearsatcompany,
    cast(yearsincurrentrole as int) as yearsincurrentrole,
    cast(yearssincelastpromotion as int) as yearssincelastpromotion,
    cast(yearswithcurrmanager as int) as yearswithcurrmanager,
    created_at

from {{source('raw_schema','employee_hr_data')}}

),
bronze_clean_cte as
(
    select 
    age,
    case when attrition = 'Yes' then 1 else 0 end as attrition,
    case when business_travel='Travel_Frequently' then 'Travel Frequently'
         when business_travel='Travel_Rarely' then 'Travel Rarely'
         when business_travel='Non-Travel' then 'Non Travel'
         else 'Not allowed' end as business_travel,
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
    case when over18 = 'Yes' then 1 else 0 end as over18,
    case when overtime = 'Yes' then 1 else 0 end as overtime,
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
    created_at
    from get_raw_cast_data

)
select * from bronze_clean_cte