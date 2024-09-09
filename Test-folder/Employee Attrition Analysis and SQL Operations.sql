-- Databricks notebook source
select "I'm running SQL"

-- COMMAND ----------

select * from emp_attrition;

-- COMMAND ----------

select * from emp_attrition;

-- COMMAND ----------

ALTER TABLE emp_attrition SET TBLPROPERTIES (
    'delta.minReaderVersion' = '2',
    'delta.minWriterVersion' = '5',
    'delta.columnMapping.mode' = 'name'
);

ALTER TABLE emp_attrition DROP COLUMN id;

-- COMMAND ----------

create table emp_attrition_temp as
select 
      row_number() over (order by Age) as id,*
from emp_attrition;

-- COMMAND ----------

select * from emp_attrition_temp;

-- COMMAND ----------

drop table emp_attrition;

-- COMMAND ----------

alter table emp_attrition_temp rename to emp_attrition;

-- COMMAND ----------

select * from emp_attrition;

-- COMMAND ----------

select sum(EmployeeCount),
case when Age between 20 and 25 then '20-25' when Age between 26 and 30 then '26-30' when Age between 31 and 35 then '31-35' when Age between 36 and 40 then '36-40' when Age between 41 and 45 then '41-45' else '40+' end age_group
from emp_attrition
where Attrition="Yes"
group by 2;

-- COMMAND ----------

select sum(EmployeeCount), Department from emp_attrition
where Attrition="Yes"
group by Department;

-- COMMAND ----------

select sum(EmployeeCount),  
case when education="1" then "Below College" when education="2" then "College" when education="3" then "Bachelor" when education="4" then "Masters" when education="5" then "Doctor" end ed_group
from emp_attrition
where Attrition="Yes"
group by 2;

-- COMMAND ----------

select sum(EmployeeCount), 
case when EnvironmentSatisfaction="1" then "low" when EnvironmentSatisfaction="2" then "medium" when EnvironmentSatisfaction="3" then "high" when EnvironmentSatisfaction="4" then "very high" end emp_satisfaction
from emp_attrition
where Attrition="Yes"
group by 2;

-- COMMAND ----------

select sum(EmployeeCount), BusinessTravel from emp_attrition
where Attrition="Yes"
group by 2;

-- COMMAND ----------


