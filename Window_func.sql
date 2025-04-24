use my_window_func;

-- ========== Row_Number(), Rank(), Dense_rank()===========================
-- Row_Number() Assigns a unique number to each row
select *, row_number() over(order by marks desc) as 'row number'from students;

-- Rank() rows, but skips numbers if there's a tie
select * , rank() over(order by marks desc) as 'rank' from students;

-- Dense_Ranks rows without skipping numbers for ties
select *, dense_rank() over(order by marks desc) as 'rank2' from students;

-- partition by , will see marks rank for each partition.
select *, row_number() over (partition by subject order by marks desc) as 'row' from students;

select *, rank() over (partition by subject order by marks desc) as 'Rank' from students;

select * , dense_rank() over (partition by subject order by marks) as 'dense_rank' from students;

-- ========================================================================================================

select * from profitdata;
-- ==================================== LEAD_FUNCTION======================================================

-- Lead function will shows next data (here we can see next month profit data)
select *, lead(profit) over (partition by product order by MonthNumber) as next_month_profit from profitdata;

select MonthNumber, MonthName, sum(profit) as total_profit,
lead(sum(profit)) over (order by MonthNumber asc) as next_total_profit
from profitdata
group by MonthNumber, MonthName;

-- ====================================LAG_FUNCTION ==========================================================

select * from profitdata;
-- Lead function will shows previous data (here we can see previous month profit data)
select * , lag(profit) over (partition by product order by MonthNumber) as previous_data from profitdata;

select MonthNumber, MonthName, sum(profit) as total_profit,
lag(sum(profit)) over (order by MonthNumber asc) as previous_total_profit
from profitdata
group by MonthNumber, MonthName;


-- ==================================ISNULL() ============================================
-- ifnull() we can replace null values with some values in it.
select * from customers;
select CustomerID, ifnull(email, 'Email not available') as Email, ifnull(PhoneNumber, 'PH no not available') as Contact_no from customers;

-- ================================Coalesce ==============================================

select coalesce(null, null, 'c'); -- will display first non null value;

-- same for this example, if email available it will show email, or if ph available will show it in data, or will show
-- custom msg if both unavailable.

select CustomerID, coalesce(email,PhoneNumber,'Contact N/A') as contact_details from customers;

-- ================================= First_value ============================================
-- First_value shows first value in a data.
select * from employeesalaries;

select *, first_value(Salary) over (order by Salary asc) as min_salary from employeesalaries;

select *, first_value(EmployeeName) over (order by Salary asc) as Emp_with_min_salary
, first_value(Salary) over (order by Salary asc) as min_salary from employeesalaries;

select *, first_value(EmployeeName) over (partition by Department order by Salary) as emp_with_low_salary_ineach_dept 
from employeesalaries;

-- ================================= Last_value ============================================
-- Last_value shows Last value in a data.
select * from employeesalaries;

select *, last_value(Salary) over (order by Salary rows between unbounded preceding and unbounded following) 
as max_salary from employeesalaries;