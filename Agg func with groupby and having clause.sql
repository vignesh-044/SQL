use customers;

select * from employees;
select  Department, max(Salary)as maximum_salary, max(Salary)*12 as annual_tenure from employees
group by Department;

select count(distinct(Department)) from employees;

select distinct(Department) from employees;

select Department, min(salary) as minimum_salary, min(salary)*12 as annual_Tenure from employees
group by Department;

SELECT Department, COUNT(*) AS TotalEmployees FROM employees
GROUP BY Department;

select Department, sum(Salary), avg(Salary), min(Salary), max(Salary) from employees
group by Department order by Department desc;

-- groupby
select  EmployeeID, Department , max(salary) from employees group by EmployeeID, Department;

-- Having
select  EmployeeID, Department , max(salary) from employees group by EmployeeID, Department having  max(salary)<75000;

select  EmployeeID, Department , max(salary) from employees group by EmployeeID, Department having  max(salary)<75000 and Department = 'Marketing';