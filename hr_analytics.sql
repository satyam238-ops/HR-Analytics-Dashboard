select * from hr_data;

--Q! Attrition rate by department.
select department,count(*) as total_Employees,
sum(case when attrition='Yes' then 1 else 0 end) as attrition_count
from hr_data
group by department;

--Q2 Attrition by job role.
select jobrole,count(*) as employees,
sum(case when attrition='Yes' then 1 else 0 end) as attrition_count
from hr_data
group by jobrole
order by attrition_count desc;

--Q3 Average income by department.
select department,round(avg(monthlyincome),2)as avg_income
from hr_data
group by department;

--Q4 Attrition by business Travel.
select business_travel,count(*) as employees,
sum(case when attrition='Yes'then 1 else 0 end) as attrition_count
from hr_data
group by business_travel
order by attrition_count desc;

--Q5 Attrition by work life balance.
select work_life_balance,count(*) as employees,
sum(case when attrition='Yes'then 1 else 0 end) as attrition_count
from hr_data
group by work_life_balance
order by attrition_count desc;

--Q6 Top 10 highest paid employee?
select jobrole,monthlyincome
from hr_data
order by monthlyincome desc
limit 10;

--Q7 Rank Department by attrition.
select department,
sum(case when attrition='Yes' then 1 else 0 end) as attrition_count,
rank() over( order by sum(case when attrition='Yes' then 1 else 0 end)desc) as attrition_rank
from hr_data
group by department;

--Q8 Compare salary to department average
select department,
monthlyincome,
avg(monthlyincome) over(partition by department) as dept_avg_income
from hr_data;

--Q9 Employee stuck without promotion.
select jobrole,
count(*) as employees
from hr_data
where years_since_last_promotion >=5
group by jobrole
order by employees desc;

--Q10 High perfromers at risk.
select jobrole,
round(avg(jobsatisfaction),2) as avg_satisvaction,
round(avg(work_life_balance),2) as avg_worklife
from hr_data
where attrition='Yes'
group by jobrole;

--Q11 Young employee leaving.
select age_group,
count(*) as employees,
sum(case when attrition='Yes' then 1 else 0 end) as attrition_count
from hr_data
group by  age_group;

--Q12 Most loyal customer.
select jobrole,
round(avg(years_at_company),2) as avg_year
from hr_data
group by jobrole
order by avg_year desc;

