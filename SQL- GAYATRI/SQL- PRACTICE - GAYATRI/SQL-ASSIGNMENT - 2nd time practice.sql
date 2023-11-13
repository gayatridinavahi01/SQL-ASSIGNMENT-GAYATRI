USE HR ;

SELECT *  from employees ;

-- XXXXXXXXXXXXXX PAGE 29 XXXXXXXXXXXXXX
-- 1. Display all information in the tables EMP and DEPT.
SELECT * FROM EMPLOYEES INNER JOIN DEPARTMENTS ;

-- 2. Display only the hire date and employee name for each employee.
SELECT FIRST_NAME , LAST_NAME , HIRE_DATE FROM EMPLOYEES ;

-- 3. Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title
SELECT  * FROM HR.EMPLOYEES ;
SELECT CONCAT( FIRST_NAME, ' ', LAST_NAME, ' ', JOB_ID  ) FROM EMPLOYEES ;

-- 4. Display the hire date, name and department number for all clerks.
SELECT * FROM HR.EMPLOYEES;  
SELECT HIRE_DATE , FIRST_NAME , LAST_NAME , DEPARTMENT_ID FROM EMPLOYEES ;

-- 5. Create a query to display all the data from the EMP table. Separate each column by a  comma. Name the column THE OUTPUT 
SELECT * FROM EMPLOYEES;
SELECT CONCAT_WS(' - ' , EMPLOYEE_ID , FIRST_NAME, LAST_NAME , EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID ) 
" CONCAT WITH SEPARATOR "
FROM EMPLOYEES ;

-- 6. Display the names and salaries of all employees with a salary greater than 2000.
SELECT * FROM EMPLOYEES ;
SELECT FIRST_NAME , LAST_NAME , SALARY FROM EMPLOYEES 
WHERE SALARY > 2000 ;

-- 7. Display the names and dates of employees with the column headers "Name" and "Start Date" .
SELECT * FROM HR.EMPLOYEES ;
SELECT CONCAT( FIRST_NAME , ' ', LAST_NAME) "NAME ", HIRE_DATE  "START DATE"
FROM EMPLOYEES ;

-- 8. Display the names and hire dates of all employees in the order they were hired.
SELECT * FROM EMPLOYEES ;
SELECT CONCAT( FIRST_NAME , ' ', LAST_NAME ) "NAME" , DATE_FORMAT(HIRE_DATE , '%D  %M , %Y')  "START DATE " 
FROM EMPLOYEES ORDER BY HIRE_DATE ASC ;

-- 9. Display the names and salaries of all employees in reverse salary order.
SELECT * FROM EMPLOYEES ;
SELECT 
CONCAT( FIRST_NAME , ' ', LAST_NAME ) "NAME" , SALARY 
FROM EMPLOYEES ORDER BY SALARY DESC ;


-- 10. Display 'ename" and "deptno" who are all earned commission and display salary in reverse order.
SELECT  CONCAT( FIRST_NAME , ' ', LAST_NAME ) "EMP NAME" ,
DEPARTMENT_ID , SALARY , COMMISSION_PCT  FROM EMPLOYEES ORDER BY SALARY DESC ;

-- 11. Display the last name and job title of all employees who do not have a manager
SELECT FIRST_NAME , LAST_NAME , JOB_ID FROM EMPLOYEES WHERE MANAGER_ID IS NULL ;

-- 12. Display the last name, job, and salary for all employees whose job is sales representative or 
-- stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000.

SELECT * FROM EMPLOYEES ;
SELECT * FROM JOBS WHERE JOB_TITLE LIKE '%SALES REPRESENTATIVE%'OR J.JOB_TITLE LIKE '%STOCK CLERK%';
SELECT E.FIRST_NAME , E.LAST_NAME , E.JOB_ID , E.SALARY , J.JOB_TITLE
FROM EMPLOYEES E  JOIN JOBS J 
ON E.JOB_ID = J.JOB_ID 
WHERE J.JOB_TITLE IN ( SELECT JOB_TITLE FROM JOBS WHERE JOB_TITLE LIKE '%SALES REPRESENTATIVE%'OR JOB_TITLE LIKE '%STOCK CLERK%' ) 
AND 
E.SALARY NOT IN (2500, 3500, 5000) ;

--  XXXXXXXXXXXXXXXXXXXXXXXXXXXXX PAGE 30 XXXXXXXXXXXXXXXXXXXXXXXXXXX
-- 1) Display the maximum, minimum and average salary and commission earned.
USE HR ;
SELECT * FROM EMPLOYEES ;
SELECT MIN(SALARY), MAX(SALARY), AVG(SALARY) , COMMISSION_PCT FROM EMPLOYEES
GROUP BY COMMISSION_PCT HAVING COMMISSION_PCT;

-- 2) Display the department number, total salary payout and total commission payout for each department.
SELECT DEPARTMENT_ID, SUM(SALARY) , SUM(COMMISSION_PCT) FROM EMPLOYEES GROUP BY DEPARTMENT_ID ; 

-- 3) Display the department number and number of employees in each department.
SELECT DEPARTMENT_ID , COUNT(FIRST_NAME)  FROM EMPLOYEES GROUP BY DEPARTMENT_ID ;


-- 4) Display the department number and total salary of employees in each department.
SELECT DEPARTMENT_ID , SUM(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID ;
