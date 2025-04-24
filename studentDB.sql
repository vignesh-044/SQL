create database Tableau_project1;
use Tableau_project1;

describe student;

select * from student;
select Gender,count(*) from student
group by Gender;

SET SQL_SAFE_UPDATES = 0;
update student set Gender = 'F' where Gender = 'Female';
update student set Gender = 'M' where Gender = 'Male';

select * from student where Gender is null or Age is null;

select Age, count(*) as count_per_Age from student group by Age order by Age desc;

alter table student add Age_group varchar(255);

UPDATE student
SET Age_group = 
  CASE 
    WHEN Age BETWEEN 18 AND 24 THEN 'A1'
    WHEN Age BETWEEN 25 AND 30 THEN 'A2'
    ELSE 'A3'
  END;
select Age_group, count(*) from student group by Age_group;

alter table student add Index_no INT AUTO_INCREMENT PRIMARY KEY;


UPDATE student SET Depression = 'No' WHERE Depression = 0;

UPDATE student SET Depression = 'Yes' WHERE Depression = 1;

SHOW VARIABLES LIKE 'secure_file_priv';

SELECT * FROM student
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/student_cleaned.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n';