
--HR_Analytics Project

select *
from [Midterm Project].[dbo].[HR_Data Analytics]


-- 1.	What is the employee headcount? 
select count(EmployeeNumber) as TotalEmployeeHeadcount 
from [dbo].[HR_Data Analytics]

--2.	What is the breakdown of the headcount by Gender.
select Gender, count(Gender) as Total_Headcount
from [dbo].[HR_Data Analytics]
group by Gender


--2.	What is the breakdown of the headcount by Department
select Department, count(Department) as Total_Headcount
from [dbo].[HR_Data Analytics]
group by Department


-- 2.	What is the breakdown of the headcount by Job role.
select JobRole, count(JobRole) as Total_Headcount
from [dbo].[HR_Data Analytics]
group by JobRole

--2.	What is the breakdown of the headcount by Marital status. 
select MaritalStatus, count(MaritalStatus) as Total_Headcount
from [dbo].[HR_Data Analytics]
GROUP BY MaritalStatus

--3.	What is the total monthly salary the company paid? 
select sum(MonthlyIncome) as TotalMonthlySalary
from [dbo].[HR_Data Analytics]

--4.	What is the employee turnover rate?  
select Attrition, count(Attrition) as total_employee, concat(format(((233.0 / 1470.0) * 100), '0'), '% Turnover') aS Turnover
from [dbo].[HR_Data Analytics]
group by Attrition
Having Attrition='yes'

--5.	What is the ratio of attrition by department? 
select Department,
       count(NULLIF(Attrition, 'No')) as AttritionCount,
       count(*) AS TotalCount,
       100 * count(NULLIF(Attrition, 'No')) / count(*) as AttritionPercentage
from [dbo].[HR_Data Analytics]
Group by Department

-- 6.	What is the ratio of attrition by Job role? 
select JobRole,
    count(case when Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    count(*) AS TotalCount,
    cast(count(case when Attrition = 'Yes' THEN 1 END) AS FLOAT) / count(*) as AttritionPercentage
from [dbo].[HR_Data Analytics]
group by JobRole


--7.	What percentage of employees are in a certain age bracket?  
select AgeGroup,
(count(AgeGroup) * 100 / (select count(*) from [dbo].[HR_Data Analytics])) as Percentage
from [dbo].[HR_Data Analytics]
group by AgeGroup
having count(*) > 18
order by AgeGroup asc

--8.	Is there any correlation between age group and monthly income? 
select AgeGroup, 
Avg(MonthlyIncome) as AvgMonthlyIncome
from [dbo].[HR_Data Analytics]
group by AgeGroup
having count (*) > 18
order by AgeGroup 

--9.	What percentage of employees are in a certain performance rating?
select PerformanceRating, count(EmployeeNumber) as TotalEmployee,
(count(EmployeeNumber) * 100.0 / (select count(*) from [dbo].[HR_Data Analytics])) as Percentage
from [dbo].[HR_Data Analytics]
group by PerformanceRating
order by PerformanceRating asc


--10.	What is the Job satisfaction score of the company? 
select Avg(JobSatisfaction) as TotalJobSatisfactionScore
from [dbo].[HR_Data Analytics]

--11.	What is the Job satisfaction score by department? 
select distinct Avg ( JobSatisfaction) as AvgJobSatisfaction, Department
from [dbo].[HR_Data Analytics]
group by Department
order by AvgJobSatisfaction ASC

--12.	What is the Job satisfaction score by Job role? 
select Avg(JobSatisfaction) as AvgJobsatisfaction, JobRole
from [dbo].[HR_Data Analytics]
group by JobRole
order by AvgJobsatisfaction ASC

--13.	Is there any correlation between job satisfaction level and employee retention? 
select yearsatcompany, AVG(JobSatisfaction) as AvgJobSatisfaction, count(*) as Numofemp
from [dbo].[HR_Data Analytics]
group by YearsAtCompany
order by YearsAtCompany asc

--14.	What are the total training hours per department?  
select sum(TrainingTimesLastYear) as TotalTrainingHr, Department
from [dbo].[HR_Data Analytics]
group by Department
order by TotalTrainingHr 

--15.	Is there any correlation between job satisfaction level and Training hours?
select JobSatisfaction, sum(TrainingTimesLastYear) as TotalTrainingHrs
from [dbo].[HR_Data Analytics]
group by JobSatisfaction 
order by JobSatisfaction asc