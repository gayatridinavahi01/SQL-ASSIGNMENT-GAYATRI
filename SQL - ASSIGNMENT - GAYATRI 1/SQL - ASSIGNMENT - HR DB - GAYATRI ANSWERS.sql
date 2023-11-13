USE HR;

SELECT * FROM COUNTRIES ;
SELECT * FROM LOCATIONS ;
SELECT * FROM JOBS ;
SELECT * FROM JOB_HISTORY ;
SELECT * FROM EMPLOYEES ;
SELECT * FROM DEPARTMENTS ;
SELECT * FROM REGIONS ;
-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX PAGE 29 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

--  1.  Display all information in the tables EMP and DEPT. 
SELECT * FROM EMPLOYEES  e INNER JOIN DEPARTMENTS d
on e.department_id = d.department_id ;


-- 2. Display only the hire date and employee name for each employee 

SELECT FIRST_NAME , HIRE_DATE  FROM EMPLOYEES ;

-- 3. Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title
SELECT  CONCAT(E.FIRST_NAME , E.LAST_NAME,  '  ,   ', J.JOB_ID)  AS EMPLOYEE_AND_TITLE 
FROM EMPLOYEES E JOIN  JOBS J 
ON E.JOB_ID = J.JOB_ID;

--  4.  Display the hire date, name and department number for all clerks. 
SELECT JH.START_DATE  AS HIREDATE, E.FIRST_NAME AS EMPLOYEENAME ,  E.DEPARTMENT_ID AS DEPARTMENT_NUM 
FROM JOB_HISTORY JH  JOIN EMPLOYEES E 
ON JH.EMPLOYEE_ID= E.EMPLOYEE_ID AND 
JH.DEPARTMENT_ID = E.DEPARTMENT_ID;
    
-- 5. Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT

SELECT CONCAT( EMPLOYEE_ID, ' ,' ,FIRST_NAME ,' ,' ,LAST_NAME ,' ,' ,EMAIL ,' ,' ,PHONE_NUMBER ,' , ' ,HIRE_DATE ,' ,' ,JOB_ID ,' ,' ,SALARY, ',' ,COMMISSION_PCT ,' ,' , MANAGER_ID , ',' , DEPARTMENT_ID  ) 
AS OUTPUT FROM EMPLOYEES ;

-- 6. Display the names and salaries of all employees with a salary greater than 2000
SELECT FIRST_NAME , LAST_NAME , SALARY FROM EMPLOYEES WHERE SALARY > 2000 ;

-- 7.  Display the names and dates of employees with the column headers "Name" and "StartDate" .
SELECT CONCAT( FIRST_NAME, '  ' ,LAST_NAME ) AS NAME,  HIRE_DATE AS STARTDATE FROM EMPLOYEES;

-- 8. Display the names and hire dates of all employees in the order they were hired. 
SELECT CONCAT( FIRST_NAME ,'   ', LAST_NAME ) " Full Name ", HIRE_DATE FROM EMPLOYEES ORDER BY HIRE_DATE ASC ;

-- 9. Display the names and salaries of all employees in reverse salary order. 
select concat( first_name, '  ', Last_name)   " Full Name", salary from employees  order by salary desc ;

--  10.  Display 'ename" and "deptno" who are all earned commission and display salary in reverse order
SELECT CONCAT(FIRST_NAME , '   ',  LAST_NAME ) AS ENAME , DEPARTMENT_ID  AS DEPTNO, SALARY , COMMISSION_PCT 
FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL 
ORDER BY SALARY DESC ;

-- 11. Display the last name and job title of all employees who do not have a manager 
SELECT E.LAST_NAME , J.JOB_TITLE , E.JOB_ID  FROM EMPLOYEES E JOIN  JOBS J  ON E.JOB_ID =J.JOB_ID 
WHERE manager_id is null ;

-- 12. . Display the last name, job, and salary for all employees whose job is sales representative 
-- or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000
SELECT * FROM JOBS WHERE JOB_TITLE LIKE 'SALE%' ; --   ROUGH WORK
SELECT E.LAST_NAME , J.JOB_TITLE, E.SALARY FROM EMPLOYEES E JOIN JOBS J 
ON J.JOB_TITLE like '%SALES REPRESENTATIVE%' ;


-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX PAGE 30 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- 1) Display the maximum, minimum and average salary and commission earned. 
SELECT MIN(SALARY) "lowest salary", MAX(SALARY) "Highest salary", AVG(SALARY)  "Average Salary" , MAX(COMMISSION_PCT) " Highest commission" , 
MIN(COMMISSION_PCT) "Lowest Commission", AVG(COMMISSION_PCT) " Average Salary"
 FROM EMPLOYEES  ;

-- 2) Display the department number, total salary payout and total commission payout for  each department.
 
SELECT D. DEPARTMENT_ID , SUM(E.SALARY) " Total Salary Payout ", SUM(E.COMMISSION_PCT) "Total Commission Payout"  
FROM DEPARTMENTS D JOIN EMPLOYEES E
 ON  D.DEPARTMENT_ID =  E.DEPARTMENT_ID 
 GROUP BY D.DEPARTMENT_ID ; 
 
 -- 3) Display the department number and number of employees in each department. 
 SELECT D.DEPARTMENT_ID, COUNT(E.FIRST_NAME) , COUNT(E.LAST_NAME) FROM  DEPARTMENTS D  JOIN EMPLOYEES E 
 GROUP BY D.DEPARTMENT_ID ;
 
 -- 4) Display the department number and total salary of employees in each department. 
SELECT D.DEPARTMENT_ID, SUM(E.SALARY)  FROM DEPARTMENTS D JOIN EMPLOYEES E 
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY DEPARTMENT_ID ;

-- 5) Display the employee's name who doesn't earn a commission. Order the result setwithout using the column name 
SELECT CONCAT( FIRST_NAME,'  ', LAST_NAME) AS ' ', COMMISSION_PCT AS '  '    FROM EMPLOYEES  WHERE COMMISSION_PCT IS NULL ;

-- 6) Display the employees name, department id and commission. If an Employee doesn't 
-- earn the commission, then display as 'No commission'. Name the columns appropriately

SELECT FIRST_NAME, DEPARTMENT_ID ,
	CASE   
	WHEN COMMISSION_PCT IS NOT NULL THEN COMMISSION_PCT
	WHEN COMMISSION_PCT IS NULL  THEN  'NO COMMISSION'
	ELSE 'INVALID CASE'
	END AS "EMPLOYEE COMMISSION STATUS "
FROM EMPLOYEES ;


-- 7) Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, 
-- then display as 'No commission. Name the columns  appropriately

SELECT FIRST_NAME, SALARY, ( COMMISSION_PCT * 2) as double_commision , IFNULL(COMMISSION_PCT, 'NO COMMISSION ') AS COMMISSION_STATUS  
FROM EMPLOYEES ;

SELECT FIRST_NAME, SALARY, COMMISSION_PCT AS "CURRENT COMMISSION" , 
	CASE
	WHEN  COMMISSION_PCT IS NOT NULL  THEN COMMISSION_PCT * 2 
    WHEN COMMISSION_PCT IS NULL  THEN  'NO COMMISSION'
    ELSE 'INVALID CASE'
    END   AS " EMPLOYEE COMMISSION STATUS"
FROM EMPLOYEES ;



-- 8) Display the employee's name, department id who have the first name same as another employee
--  in the same department
SELECT A.FIRST_NAME , A.LAST_NAME , A.DEPARTMENT_ID 
FROM EMPLOYEES A JOIN EMPLOYEES B
WHERE A.FIRST_NAME = B.FIRST_NAME 
AND A.DEPARTMENT_ID = B.DEPARTMENT_ID ;

-- 9) Display the sum of salaries of the employees working under each Manager. 
SELECT SUM(SALARY) AS 'TOTAL SALARY' , MANAGER_ID FROM EMPLOYEES  GROUP BY MANAGER_ID ;

-- 10) Select the Managers name, the count of employees working under and the department ID of the manager.
	SELECT COUNT(FIRST_NAME) , MANAGER_ID FROM EMPLOYEES GROUP BY MANAGER_ID ORDER BY MANAGER_ID ASC ; 

SELECT * FROM EMPLOYEES;

SELECT   COUNT(A.EMPLOYEE_ID) , A.DEPARTMENT_ID 
FROM EMPLOYEES A  JOIN EMPLOYEES B
WHERE B.DEPARTMENT_ID = A.DEPARTMENT_ID 
GROUP BY DEPARTMENT_ID ;

-- 11) Select the employee name, department id, and the salary. Group the result with the
--  manager name and the employee last name should have second letter 'a! 
 
 SELECT first_name "employee name " ,DEPARTMENT_ID, SALARY ,  manager_name "  MANAGER NAME " 
 FROM EMPLOYEES  
 WHERE LAST_NAME LIKE '_A%'
 GROUP BY department_id , MANAGER_NAME ,first_name , salary;
 
 select first_name , department_id from employees group by department_id ;
 
 -- 12) Display the average of sum of the salaries and group the result with the department id.  
 -- Order the result with the department id.

SELECT SUM(SALARY), DEPARTMENT_ID FROM EMPLOYEES GROUP BY DEPARTMENT_ID  ;
SELECT AVG(SALARY), DEPARTMENT_ID  FROM EMPLOYEES GROUP BY DEPARTMENT_ID ;

select avg( sum(salary) ) , department_id  from employees group by department_id ;

/* UNABLE TO EXECUTE THE ACTUAL QUERY */

-- 13) Select the maximum salary of each department along with the department id
SELECT MAX(SALARY) , DEPARTMENT_ID FROM EMPLOYEES GROUP BY DEPARTMENT_ID ;

-- 14) Display the commission, if not null display 10% of salary, if null display a default value 1

SELECT  MANAGER_ID ,  SALARY, COMMISSION_PCT,  
CASE 
WHEN COMMISSION_PCT IS NOT NULL THEN 0.1 * SALARY
WHEN COMMISSION_PCT IS NULL THEN  1
ELSE 'invalid case'
END AS UPDATED_COMMISION
FROM EMPLOYEES  ; 

USE HR ;

-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXX  PAGE 31 XXXXXXXXXXXXXXXXXXXX

-- 1. Write a query that displays the employee's last names only from the string's 2-5th  position 
-- with the first letter capitalized and 
-- all other letters lowercase, Give each column an  appropriate label.
  
  SELECT  CONCAT( 
  UPPER( SUBSTR(E.LAST_NAME, 2,1 )  ) , 
  LOWER( SUBSTR(E.LAST_NAME , 3, 5 ) ) 
  ) AS FULL_NAME 
  FROM EMPLOYEES E; 
  
  -- 2. Write a query that displays the employee's first name and last name along with a " in between for e.g.: first name : Ram; 
  -- last name : Kumar then Ram-Kumar. Also displays the month on which the employee has joined.
  
  SELECT FIRST_NAME  , CONCAT(' - ')  AS '- ', LAST_NAME ,
  CONCAT(FIRST_NAME  , CONCAT(' - ') , LAST_NAME ) as formatted_name, Date_format(HIRE_DATE , '%M') as month
  FROM EMPLOYEES E 
  WHERE FIRST_NAME LIKE "%A%"  AND LAST_NAME LIKE "%A%"  ; 
  
-- 3. Write a query to display the employee's last name and if half of the salary is greater than  
-- ten thousand then increase the salary by 10% 
-- else by 11.5% along with the bonus amount of 1500 each. 
-- Provide each column an appropriate label.  
  
  SELECT LAST_NAME , SALARY , SALARY/2 AS HALF_SALARY ,
  CASE
		WHEN  (SALARY/ 2) > 10000 THEN 1.1 * SALARY 
		WHEN  (SALARY / 2) < 10000 THEN (1.115 * SALARY) + 1500 
		ELSE ' INVALID CASE'
  END AS UPDATED_SALARY
  FROM EMPLOYEES  ;
  
-- 4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, 
-- department id, salary and the manager name all in Upper case, 
-- if the Manager name consists of 'z' replace it with '$!

SELECT 
  CONCAT(SUBSTRING(employee_id, 1, 2), '00', SUBSTRING(employee_id, 3), 'E') AS formatted_employee_id,
  UPPER(department_id) AS formatted_department_id,
  UPPER(salary) AS formatted_salary,
  REPLACE(UPPER(manager_name), 'Z', '$!') AS formatted_manager_name
FROM employees;

select manager_name from employees where manager_name like '%z%';

-- 5. Write a query that displays the employee's last names with the first letter capitalized and all other letters 
-- lowercase, and the length of the names, for all employees whose name starts with J, A, or M. 
-- Give each column an appropriate label. Sort the results by the  employees' last names

SELECT  CONCAT
( 
UPPER(SUBSTR( LAST_NAME,1,1) ) , 
LOWER( SUBSTR(LAST_NAME,2,10) )
) AS SURNAME,
LENGTH(  LAST_NAME ) as "length of surname "
  FROM EMPLOYEES 
  WHERE 
		FIRST_NAME LIKE 'J%' 
        OR
        FIRST_NAME LIKE  'A%' 
        or
        FIRST_NAME LIKE 'M %'
        or 
        LAST_NAME LIKE 'J%' 
        OR
        LAST_NAME LIKE  'A%' 
        or
        LAST_NAME LIKE 'M %'
ORDER BY LAST_NAME ASC;
  
  --  6. Create a query to display the last name and salary for all employees. 
  -- Format the salary to be 15 characters long, left-padded with $. 
  -- Label the column SALARY
  
  SELECT LAST_NAME , SALARY,   CONCAT( ' $ ' , RPAD(SALARY, 15, 0) ) AS SALARY FROM EMPLOYEES ;
  
  -- 7. Display the employee's name if it is a palindrome
  SELECT FIRST_NAME , REVERSE(FIRST_NAME) FROM EMPLOYEES ; /* ONLY FOR TRIAL*/
  
  SELECT FIRST_NAME  FROM EMPLOYEES 
 WHERE FIRST_NAME LIKE REVERSE(FIRST_NAME) ;
  
  -- 8. Display First names of all employees with initcaps.
 
  SELECT CONCAT(
  SUBSTRING(FIRST_NAME,1,1), '',   SUBSTRING(FIRST_NAME,2)
  ) AS " INIT CAP FIRST NAMES" 
  FROM EMPLOYEES;
  
  -- 9. From LOCATIONS table, extract the word between first and second space from the  STREET ADDRESS column.
   select street_address from locations ; /* FOR TRIAL BASIS*/
   select street_address from locations WHERE  street_address like ' % ' ;  -- trial 1 
  SELECT  charindex( ' ' , street_address ) from locations ; -- trial 2
   select SUBSTRING_INDEX(SUBSTRING_INDEX(street_address, ' ', 2), ' ', -1) as street_name  from locations ;
   
   select substring_index(substring_index(street_address, ' ' , 2), ' ', -1) from locations;
   
-- 10. Extract first letter from First Name column and append it with the Last Name. 
-- Also add  "@systechusa.com" at the end. 
-- Name the column as e-mail address. All characters should be in lower case. 
-- Display this along with their First Name.

SELECT FIRST_NAME , LOWER(
CONCAT(SUBSTRING(FIRST_NAME ,1,1) , LAST_NAME, '@systechusa.com' ))AS EMAIL_ADDRESS 
FROM EMPLOYEES;

-- 11. Display the names and job titles of all employees with the same job as Trenna.
 SELECT FIRST_NAME , JOB_ID FROM EMPLOYEES WHERE FIRST_NAME ='TRENNA' ; /* TRIAL BASIS*/
 
SELECT E.FIRST_NAME , E.LAST_NAME, E.JOB_ID , J.JOB_TITLE  
FROM EMPLOYEES E JOIN JOBS J WHERE E.JOB_ID IN 
(SELECT JOB_ID FROM EMPLOYEES WHERE FIRST_NAME = 'TRENNA');

-- 12. Display the names and department name of all employees working in the same city as Trenna.
SELECT E.FIRST_NAME , E.DEPARTMENT_ID, D.DEPARTMENT_NAME , L.CITY 
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
	ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
	INNER JOIN LOCATIONS L 
	ON D.LOCATION_ID = L.LOCATION_ID 
WHERE   L.CITY IN 
		(SELECT CITY FROM LOCATIONS   WHERE FIRST_NAME = 'TRENNA');

-- 13. Display the name of the employee whose salary is the lowest.
ALTER TABLE EMPLOYEES MODIFY SALARY INT;
SELECT FIRST_NAME, LAST_NAME , SALARY FROM EMPLOYEES WHERE SALARY IN (SELECT MIN(SALARY)FROM EMPLOYEES);

-- 14. Display the names of all employees except the lowest paid.
SELECT FIRST_NAME, LAST_NAME , SALARY FROM EMPLOYEES WHERE SALARY NOT IN (SELECT MIN(SALARY)FROM EMPLOYEES)  ORDER BY SALARY ASC;

-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  PAGE 32 XXXXXXXXXXXXXXXXXXXXXXX

-- 1. Write a query to display the last name, department number, department name for all employees.
SELECT E.LAST_NAME , E.DEPARTMENT_ID, D.DEPARTMENT_NAME 
FROM EMPLOYEES E JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID ;
 
 -- 2. Create a unique list of all jobs that are in department 4. Include the location of the 
 -- department in the output.
 select  * from EMPLOYEES where department_id = 40 ;

 select e.job_id, d.department_id , L.CITY
 from employees e JOIN  departments d 
 on e.department_id = d.department_id
 JOIN LOCATIONS L
 ON D.LOCATION_ID = L.LOCATION_ID
  where  d.DEPARTMENT_ID = 40;

  -- 3. Write a query to display the employee last name,department name,location id and 
  -- city of all employees who earn commission. 
  
 select
 e.last_name, 
 e.department_id,d.department_name , 
 d.location_id  as Location_code, 
 l.city as city, e.commission_pct as COMMISSION
 from employees E  join departments D  on e.department_id = d.department_id
  join locations L on d.location_id = l.location_id
  where  e.commission_pct is not null  ;
 
 /* 4. Display the employee last name and department name of all employees who have an 'a' in their last name
 */
 
 SELECT E.LAST_NAME , D.DEPARTMENT_NAME , D.DEPARTMENT_ID
 FROM EMPLOYEES E RIGHT JOIN DEPARTMENTS D  ON E.LAST_NAME LIKE '%A%';
 
 /*5. Write a query to display the last name,job,department number and department name for 
all employees who work in ATLANTA. */

SELECT * FROM LOCATIONS WHERE CITY LIKE 'ATLANTA' OR STATE_PROVINCE LIKE 'ATLANTA' ; -- ROUGH WORK

SELECT E.LAST_NAME , D.DEPARTMENT_ID, D.DEPARTMENT_NAME , L.CITY , L.STATE_PROVINCE
FROM EMPLOYEES E  JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L  ON D.LOCATION_ID = L.LOCATION_ID
WHERE  L.CITY LIKE '%ATLANTA%' OR L.STATE_PROVINCE LIKE '%ATLANTA%' ; 

/* 6. Display the employee last name and employee number along with their manager's last 
name and manager number.*/

select employee_id , manager_id ,Manager_name from employees  ;
select last_name , employee_id,  
substring_index
( 
	substring_index
	(
	manager_name, ' ',3
    ), 
' ', -1) 
as SURNAME ,
manager_id  from employees ;

/* 7. Display the employee last name and employee number along with their manager's last 
name and manager number (including the employees who have no manager). */
select * from employees WHERE EMPLOYEE_ID =101 ;
select employee_id, last_name , manager_id AS "MANAGER  NO.", 
SUBSTRING_INDEX ( SUBSTRING_INDEX(   manager_name , ' ', 3  ) , ' ', -1 )  AS "MANAGER SURNAME"
from employees ;


/* 8. Create a query that displays employees last name,department number,and all the 
employees who work in the same department as a given employee.
*/ 
 
 SELECT E.FIRST_NAME , E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME  
 FROM EMPLOYEES E JOIN DEPARTMENTS D
 ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 
 WHERE E.FIRST_NAME LIKE '%ALEXANDER%';
 
 /*9. Create a query that displays the name,job,department name,salary,grade for all employees. 
 Derive grade based on salary(>=50000=A, >=30000=B,<30000=C) */
 SELECT E.FIRST_NAME , E.LAST_NAME , E.JOB_ID , D.DEPARTMENT_ID, D.DEPARTMENT_NAME , E.SALARY ,  E.MANAGER_NAME,
 CASE 
	when e.salary >  50000 then'A'
    when e.salary > 30000 and e.salary <= 49999 then 'B'
	when e.salary <= 30000 then 'C'
    else null
END AS GRADE
FROM EMPLOYEES E  JOIN DEPARTMENTS D 
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID  ;

/*10. Display the names and hire date for all employees who were hired before their managers along withe their manager names and hire date. 
Label the columns as Employee name, emp_hire_date,manager name,man_hire_date   */
 
select CONCAT(A.FIRST_NAME, ' ' , A.LAST_NAME  ) as "EMP FULL NAME " , A.HIRE_DATE AS "EMP HIRE DATE  " , 
CONCAT( M.FIRST_NAME , '  ' ,M.LAST_NAME )AS " MANAGER NAME" , M.HIRE_DATE AS "MANAGER HIRE DATE "
from employees a INNER join employees m
where a.hire_date < m.hire_date;

-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  PAGE 34 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

/* 1. Write a query to display the last name and hire date of any employee in the same department as SALES.*/

select e.last_name , e.hire_date , d.department_id , d.department_name 
from employees e join departments d 
 on d.department_name like '%sales%';
 
 /* 2. Create a query to display the employee numbers and last names of all employees who earn more than the average salary. 
 Sort the results in ascending order of salary. */

 select employee_id, last_name , salary  
 from employees 
 where salary > ( select avg(salary) from employees)
 order by salary asc;
 
 /*3. Write a query that displays the employee numbers and last names of all employees  who work 
 in a department with  any employee whose last name contains a' u */
 
 select employee_id , first_name , last_name , department_id
 from employees 
 where last_name like 'u%' 
 order by employee_id asc;
 
 /*4. Display the last name, department number, and job ID of all employees whose
department location is ATLANTA. */
select e.last_name , e.department_id, e.job_id , l.location_id, l.city, l.state_province 
from employees e join departments d join  locations l   
on d.location_id = l.location_id 
where l.city like 'ATLANTA'  or l.state_province like 'ATLANTA' ;

select * from locations  where city like '%ATLANTA%'  or state_province  like '%ATLANTA%' ;

/*5. Display the last name and salary of every employee who reports to FILLMORE. */

select * from employees where commission_pct is null ; -- ROUGH WORK
select * from departments where manager_id is null ;-- ROUGH WORK
select * from locations where state_province is null or postal_code is null ; -- ROUGH WORK


select e.employee_id , e.last_name , e.salary ,
e.manager_id , l.state_province, l.postal_code
from employees e join departments d
	inner  join locations l 
	on  d.location_id = l.location_id 
where e.manager_id is null 
or
(l.state_province is null and l.postal_code is null ) ;


/*6. Display the department number, last name, and job ID for every employee in the 
OPERATIONS department. */

select * from departments where department_name like '%OPERATIONS%' ;

select d.department_id , e.last_name , e.job_id , d.department_name
from employees e join departments d 
where department_name like '%OPERATIONS%' ; 

/*7. Modify the above query to display the employee numbers, last names, and salaries of all employees 
who earn more than the average salary 
and who work in a department with any employee with a 'u'in their name.*/
select department_id , first_name , last_name  from employees  where first_name like '%u%' or last_name like '%u%';
select count(department_id)  from employees where first_name like '%u%' or last_name like '%u%';

select employee_id, last_name , salary from employees 
where salary > (select avg(salary ) from employees  ) 
AND
DEPARTMENT_ID IN (select department_id  from employees  where first_name like '%u%' or last_name like '%u%')
ORDER BY SALARY ASC ;

/*8. Display the names of all employees whose job title is the same as anyone in the sales dept.*/
select job_id  from jobs where job_title like '%sales%'; -- ROUGH WORK
select * from departments where department_name like '%sales%'; -- ROUGH WORK
select e.first_name , e.last_name , j.job_id, j.job_title
from employees e  join  jobs j 
	on e.job_id = j.job_id
	where e.job_id in (select job_id  from jobs where job_title like '%sales%') ;

/*9. Write a compound query to produce a list of employees showing raise percentages,  employee IDs, and salaries. 
Employees in department 1 and 3 are given a 5% raise, employees in department 2 are given a 10% raise, employees in departments 4 and 5 are 
given a 15% raise, and employees in department 6 are not given a raise.*/

select employee_id, first_name , last_name , salary , department_id, 
case
	when (department_id =10 or department_id = 30)  then  '5%'
    when (department_id = 20)  then '10%'
    when (department_id = 40 or department_id = 50)  then '15%'
    when  (department_id = 60 )  then 'NO SALARY RAISE '
    else null
end as raise_percentage 
from employees ;



/*10. Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries.*/  

SELECT   LAST_NAME , SALARY FROM EMPLOYEES order by salary desc limit 3 ;  --  TOP 3 SALARIES INCLUDING DUPLICATE SALARIES

/* 11. Display the names of all employees with their salary and commission earned. 
Employees with a null commission should have O in the commission column  */

select first_name , last_name , salary,  
case 
	when commission_pct is not null  then  commission_pct
	when  commission_pct is  null then '0'
	else 'invalid case'
end  as commission_of_employees 
from employees ;


/*12. Display the Managers (name) with top three salaries along with their salaries and  department information.*/

select E.EMPLOYEE_ID ,   E.FIRST_NAME , E.LAST_NAME , E.salary , E.DEPARTMENT_ID , D.DEPARTMENT_NAME
from employees E right JOIN DEPARTMENTS D  
on  E.EMPLOYEE_ID <> E.MANAGER_ID 
AND   E.MANAGER_ID IS NOT NULL 
order by  E.salary desc LIMIT 3 ;

 

 -- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  PAGE 35 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 
 /*1) Find the date difference between the hire date and resignation_date for all the employees. 
 Display in no. of days, months and year(1 year 3 months 5 days).
Emp_ID Hire Date Resignation_Date */

--   1)  1/1/2000 7/10/2013
   
     SELECT  e.employee_id ,  jh.start_date , jh.end_date ,
    CONCAT(
        FLOOR(DATEDIFF(jh.end_date, jh.start_date) / 365), ' years ',
        FLOOR((DATEDIFF(jh.end_date, jh.start_date) % 365) / 30), ' months ',
        DATEDIFF(jh.end_date, jh.start_date) % 30, ' days'
    ) AS duration_employed
	FROM
    Employees e join job_history jh
    on  e.hire_date = jh.start_date  
    where jh.start_date >= '2000/01/01'  and jh.end_date <= '2013/10/07' ;
    
-- 2)  4/12/2003    3/8/2017
   SELECT  e.employee_id ,  jh.start_date , jh.end_date ,
    CONCAT(
        FLOOR(DATEDIFF(jh.end_date, jh.start_date) / 365), ' years ',
        FLOOR((DATEDIFF(jh.end_date, jh.start_date) % 365) / 30), ' months ',
        DATEDIFF(jh.end_date, jh.start_date) % 30, ' days'
    ) AS duration_employed
	FROM
    Employees e join job_history jh
    on  e.hire_date = jh.start_date  
    where jh.start_date >= '2017/08/03'  and jh.end_date <= '2003/12/04' ;
  
  
-- 3) 22/9/2012     21/6/2015
 SELECT  e.employee_id ,  jh.start_date , jh.end_date ,
    CONCAT(
        FLOOR(DATEDIFF(jh.end_date, jh.start_date) / 365), ' years ',
        FLOOR((DATEDIFF(jh.end_date, jh.start_date) % 365) / 30), ' months ',
        DATEDIFF(jh.end_date, jh.start_date) % 30, ' days'
    ) AS duration_employed
	FROM
    Employees e join job_history jh
    on  e.hire_date = jh.start_date  
    where jh.start_date >= '2015/06/21'  and jh.end_date <= '2012/09/22' ;
 
-- 4) 13/4/2015 NULL

SELECT  e.employee_id ,  jh.start_date , jh.end_date ,
    CONCAT(
        FLOOR(DATEDIFF(jh.end_date, jh.start_date) / 365), ' years ',
        FLOOR((DATEDIFF(jh.end_date, jh.start_date) % 365) / 30), ' months ',
        DATEDIFF(jh.end_date, jh.start_date) % 30, ' days'
    ) AS duration_employed
	FROM
    Employees e join job_history jh
    on  e.hire_date = jh.start_date  
    where jh.start_date >= '2015/04/13'  and jh.end_date <= null ;
 

-- 5 03/06/2016 NULL

SELECT  e.employee_id ,  jh.start_date , jh.end_date ,
    CONCAT(
        FLOOR(DATEDIFF(jh.end_date, jh.start_date) / 365), ' years ',
        FLOOR((DATEDIFF(jh.end_date, jh.start_date) % 365) / 30), ' months ',
        DATEDIFF(jh.end_date, jh.start_date) % 30, ' days'
    ) AS duration_employed
	FROM
    Employees e join job_history jh
    on  e.hire_date = jh.start_date  
    where jh.start_date >= '2016/06/03'  and jh.end_date <= null ;


-- 6) 08/08/2017 NULL
SELECT  e.employee_id ,  jh.start_date , jh.end_date ,
    CONCAT(
        FLOOR(DATEDIFF(jh.end_date, jh.start_date) / 365), ' years ',
        FLOOR((DATEDIFF(jh.end_date, jh.start_date) % 365) / 30), ' months ',
        DATEDIFF(jh.end_date, jh.start_date) % 30, ' days'
    ) AS duration_employed
	FROM
    Employees e join job_history jh
    on  e.hire_date = jh.start_date  
    where jh.start_date >= '2017/08/08'  and jh.end_date <= null ;

-- 7) 13/11/2016 NULL 

SELECT  e.employee_id ,  jh.start_date , jh.end_date ,
    CONCAT(
        FLOOR(DATEDIFF(jh.end_date, jh.start_date) / 365), ' years ',
        FLOOR((DATEDIFF(jh.end_date, jh.start_date) % 365) / 30), ' months ',
        DATEDIFF(jh.end_date, jh.start_date) % 30, ' days'
    ) AS duration_employed
	FROM
    Employees e join job_history jh
    on  e.hire_date = jh.start_date  
    where jh.start_date >= '2016/11/13'  and jh.end_date <= null ;
    
/* 2) Format the hire date as mm/dd/yyyy(09/22/2003) and resignation_date as mon dd, 
yyyy(Aug 12th, 2004). Display the null as (DEC, 01th 1900)  */
select employee_id , first_name , hire_date, date_format(hire_date , '%b  %D,  %Y')  from employees ;

select e.* , 
	case 
	when  hire_date is not null then date_format(e.hire_date , '%b  %D,  %Y') 
	when  hire_date is  null then date_format('1900/12/01' , '%b  %D,  %Y')
    else null 
    end	as DATE_OF_JOINING 
from employees e ;

/*3) Calcuate experience of the employee till date in Years and months(example 1 year and 3 
months) Use Getdate() as input date for the below three questions. */
use hr;

SELECT DATEDIFF(now() , E.HIRE_DATE ) FROM EMPLOYEES E;
select E.EMPLOYEE_ID ,  concat(FLOOR(   DATEDIFF(now() , E.HIRE_DATE ) / 365), ' years ',
        FLOOR((  DATEDIFF(now() , E.HIRE_DATE )   % 365) / 30), ' months ',
       floor(  DATEDIFF(now() , E.HIRE_DATE )    % 30), ' days' ) as DURATION_EMPLOYED from employees E  ;
SELECT 
    e.Employee_ID,
    e.Hire_Date,
    jh.end_date,
    CONCAT(
        FLOOR(DATEDIFF(jh.end_date, jh.start_date) / 365), ' years ',
        FLOOR((DATEDIFF(jh.end_date, jh.start_date) % 365) / 30), ' months ',
        DATEDIFF(jh.end_date, jh.start_date) % 30, ' days'
    ) AS Date_Difference
FROM
    Employees e join job_history jh
    on e.job_id = jh.job_id;
 

/*4) Display the count of days in the previous quarter */

select floor(datediff('2023/09/30', '2023/07/01')) as last_quarter_days;

/*5) Fetch the previous Quarter's second week's first day's date */
 select date_add('2023-07-01', interval 14 day) ;
 select
 date_sub( 
 date_add(
 '2023-07-01', interval 14 day
 )  , interval 6 day)  as  "sunday of second week of july";

/*6) Fetch the financial year's 15th week's dates (Format: Mon DD YYYY) */
select date_format( '2023-04-01' + interval (15*7) day , '%M %D ,  %Y'  ) ;

/*7) Find out the date that corresponds to the last Saturday of January, 2015 using with 
clause. */
select last_day('2023-01-01') ; -- step 1 
select date_format(  last_day('2023-01-01')  , '%W')  as "last day of jan" ; -- step 2
select  date_sub(  last_day('2023-01-01')  , interval 3 day)    ; -- step 3 
