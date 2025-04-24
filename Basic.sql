use customers;

## not between
select * from employees;
##where Salary not between 60000 and 75000;

select count(Country), sum(Score) from customers;

insert into employees (EmployeeID,FirstName,LastName,Department,BirthDate,Gender, Salary,ManagerID) values
 (6,'Raj','Kumar','IT','1987-04-02 00:00:00','M',65000,1);
 
 select * from INFORMATION_SCHEMA.COLUMNS 
 where table_name = 'employees';
 
 select * from employees;

insert into employees (EmployeeID, FirstName, LastName, Department) values ( 7, 'Ravi','Kumar','IT');
insert into employees (EmployeeID, FirstName, LastName, Department) values ( 7, 'ASH','','SALES');
insert into employees (BirthDate,Gender,Salary,ManagerID) values
('1992-02-28 00:00:00','M',65000,1);

SET SQL_SAFE_UPDATES = 1;

UPDATE employees SET EmployeeID = 8 WHERE FirstName = 'ASH';

select * from employees where Gender is  null;
CREATE TEMPORARY TABLE tem_employees AS
SELECT * FROM employees;

delete from tem_employees where Gender is null;

select * from tem_employees;

select * from employees 
order by Salary desc limit 2;

SET SQL_SAFE_UPDATES = 1;
 
 create temporary table emp as select * from employees;
 
 select * from emp;
 
 delete from emp;