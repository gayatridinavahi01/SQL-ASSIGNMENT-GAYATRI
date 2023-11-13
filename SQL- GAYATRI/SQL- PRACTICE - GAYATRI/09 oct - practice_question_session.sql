create database practice3 ;
use practice3;
create table EMPLOYEEDETAIL (
Employeeid  Int Primary key,
FirstName Varchar(50) ,
LastName   Varchar(50),
Salary Decimal(10,2) ,
JoiningDate Timestamp ,
Department varchar(20) ,
Gendrer  Varchar(10)
) ;

drop table EMPLOYEEDETAIL ;

insert into EMPLOYEEDETAIL  values
(1, 'Vikas' , 'Ahlawat' , 600000.00, '2013-02-15   11:16:28.290' , 'IT',  'male'),
(2, 'NIKITA', 'JAIN', 530000.00, '2014-01-09  17:31:07.793' , 'HR' , 'Female'  ),
(3, 'Ashish', 'Kumar', 1000000.00, '2014-01-09 10:05:07.793', 'IT',  'male'),
(4 , 'Nikhil', 'Sharma' , 4800000.00, '2014-01-09  09:00:07.793', 'HR' , 'Male'  ),
(5, 'Anish', 'Kadian', 500000.00, '2014-01-09  09:31:07.793'  ,'Payroll', 'Male');

select * from EMPLOYEEDETAIL ;

-- 1)  write a query to get only firstname column from employee table  
select firstname from EMPLOYEEDETAIL ;

-- 2) write a query to get foirstname in lower and uppercase .
select firstname, ucase(firstname)  as upper_case , lcase(firstname) as lower_case from EMPLOYEEDETAIL ;

-- 3) write a query to combine  firstname and lastname .
select concat(firstname, '   ', lastname)   as fullname from EMPLOYEEDETAIL;

-- 4) write a query to get all employee details from the table whose firstnames start with 'a' ;
select firstname  as  A_starting_names from EMPLOYEEDETAIL where firstname like 'a%' or 'A%' ;

-- 5)  write a query to get firstname  starting with 'a' and lastname ending with 'r' .
select firstname , lastname from EMPLOYEEDETAIL where firstname like 'a%'and lastname like '%r' ;

-- 6)  write a query to get firstname which contains 'k'  ;
select firstname from EMPLOYEEDETAIL where firstname like '%k%' ;

-- 7) write a query to get all emplyee details whose firstname start with any single character from a to purge
select *  from EMPLOYEEDETAIL where firstname  between 'a%' and 'p%' ;  -- option 1
select * from EMPLOYEEDETAIL where firstname like 'a%'or 'b%'or 'c%'or 'd%'or 'e%'or 'f%'or 'g%'or 'h%'or 'i%' or 'j%';
select *  from EMPLOYEEDETAIL where firstname  like '[a-p]%';

-- 8)  write a query to  get the forurth highest salary
select * from employeedetail order by salary desc ;
use practice3;

select employeeid , firstname , salary from  employeedetail order by salary desc ;
select employeeid , firstname , salary from  employeedetail order by salary desc limit 1 offset 3  ; 
select employeeid , firstname , salary from  employeedetail order by salary desc  ; 




-- 9) write a query to 1st  row without condition without where ,limit
select * from employeedetail ;

select employeeid , salary ,
case 
when  max(salary) then salary
else null 
end as desired_salary
 from employeedetail 
order by salary desc ;

 select * from employeedetail where salary in (select max(salary) from employeedetail) ;
 SELECT FIRSTNAME FROM EMPLOYEEDETAIL WHERE FIRSTNAME IN (SELECT FIRSTNAME FROM EMPLOYEEDETAIL  WHERE FIRSTNAME LIKE  '%A%')  ;


-- 10 ) write a query to
SELECT CONCAT('HELLO' , '  ', FIRSTNAME)  AS GREETINGS  FROM  EMPLOYEEDETAIL ;



