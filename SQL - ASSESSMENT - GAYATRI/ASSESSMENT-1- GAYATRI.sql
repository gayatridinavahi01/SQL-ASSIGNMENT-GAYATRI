--  ASSESSMENT 1 

CREATE DATABASE MODULE4_ASSIGNMENT1_SEPT ;
 USE MODULE4_ASSIGNMENT1_SEPT ;
CREATE TABLE WORKER ( WORKER_ID INT , FIRST_NAME VARCHAR(20), LAST_NAME VARCHAR(20), SALARY INT, JOINING_DATE VARCHAR(10), DEPARTMENT VARCHAR(20) );
ALTER TABLE WORKER MODIFY JOINING_DATE VARCHAR(50);
INSERT INTO WORKER VALUES 
( 1, 'Monika', 'Arora', 100000, '2/20/2014  9:00' , 'HR'),
( 2 ,'Niharika', 'Verma', 80000, '6/11/2014  9:00' , 'ADMIN' ),
(3, 'VISHAL', 'SINGHAL', 300000, '2/20/2014 9: 00', 'HR'),
(4, 'AMITABH', 'SINGH', 500000, '2/20/2014  9:00','ADMIN'),
(5, 'VIVEK','BHATI', 500000, '6/11/2014  9:00', 'ADMIN'),
(6, 'VIPUL', 'DIWAN', 200000, '6/11/2014 9:00', 'ACCOUNT'),
(7, 'SATISH', 'KUMAR', 75000, '1/20/2014  9:00', 'ACCOUNT'),
(8, 'GEETIKA','CHAUHAN', 90000, '4/11/2014  9:00', 'ADMIN');
SELECT * FROM WORKER ;

--  1. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending //////////////////////////////////////
SELECT *  FROM WORKER  ORDER BY (FIRST_NAME) ASC,  (DEPARTMENT) DESC;
   
-- 2. Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table.
SELECT * FROM WORKER WHERE
FIRST_NAME LIKE 'VIPUL' OR FIRST_NAME LIKE 'SATISH' ;

-- 3. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets
SELECT * FROM WORKER WHERE LENGTH(FIRST_NAME) = 6 AND RIGHT(FIRST_NAME,1) LIKE 'H';

-- 4. Write an SQL query to print details of the Workers whose SALARY lies between 1.
SELECT * FROM WORKER WHERE SALARY BETWEEN  100000 and 600000 ;

SELECT * FROM WORKER ;
-- 5. Write an SQL query to fetch duplicate records having matching data in some fields of a table. 
select   DEPARTMENT, Joining_Date , Avg(salary) from Worker group by Joining_Date, DEPARTMENT  having count(joining_date) > 1;
SELECT DEPARTMENT, MAX(SALARY),COUNT(JOINING_DATE)  FROM WORKER GROUP BY DEPARTMENT HAVING COUNT(JOINING_DATE) > 1  ;
SELECT MAX(SALARY), COUNT(DEPARTMENT)  AS DEPARTMENT_TEAMMEMBERS FROM WORKER GROUP BY JOINING_DATE HAVING COUNT(DEPARTMENT) > 1;

-- 6.  Write an SQL query to show the top 6 records of a table
select  * from Worker  LIMIT 6 ;

-- 7. Write an SQL query to fetch the departments that have less than five people in them.  
SELECT DEPARTMENT , count(FIRST_NAME) from WORKER group by DEPARTMENT HAVING  COUNT(DEPARTMENT) < 5 ;

-- 8.Write an SQL query to show all departments along with the number of people in there
SELECT DEPARTMENT, COUNT(FIRST_NAME) AS EMPLOYEES_STRENGTH FROM WORKER GROUP BY DEPARTMENT ORDER BY DEPARTMENT ASC;


-- 9.Write an SQL query to print the name of employees having the highest salary in each department
    SELECT FIRST_NAME , DEPARTMENT, SALARY FROM WORKER  WHERE SALARY  IN  (SELECT  MAX(SALARY)  FROM WORKER GROUP BY DEPARTMENT) ; 
    
  SELECT FIRST_NAME , DEPARTMENT , SALARY FROM WORKER WHERE SALARY IN  (SELECT  MAX(SALARY) FROM WORKER GROUP BY DEPARTMENT) ;
  SELECT  MAX(SALARY) FROM WORKER GROUP BY DEPARTMENT;
    
select * from worker;
  UPDATE WORKER SET DEPARTMENT = 'ADMINISTRATION' WHERE DEPARTMENT LIKE 'ADM%' ;
  
--  ----------------------------------------------------------------------------------------------------
-- QUESTION 2  

 CREATE DATABASE SCHOOL ;
 USE SCHOOL ;

CREATE TABLE STUDENT
( STD_ID  INT PRIMARY KEY ,
  STD_NAME VARCHAR(20) , 
  GENDER VARCHAR(10) ,
  PERCENTAGE DECIMAL(10),
  CLASS INT ,
  SEC CHAR ,
  STREAMM VARCHAR(20),
   DOB VARCHAR(20)   ) ;
   
INSERT INTO STUDENT VALUES 
(1001, 'SUREKHA JOSHI' , 'FEMALE', 82, 12, 'A' , 'SCIENCE' , ' 3/8/1998'),
(1002, 'MAAHI AGRAWAL', 'FEMALE', 56, 11 , 'C', 'COMMERCE', '11/23/2008' ),
(1003, 'SANAM VERMA', 'MALE', 59, 11, 'C' , 'COMMERCE' , '06/29/2006'),
(1004, 'RONIT KUMAR' , 'MALE', 63,11, 'C', 'COMMERCE', '11/05/1997' ),
(1005, 'DIPESH PULKIT', 'MALE' , 78, 11 ,'B', 'SCIENCE', '14/09/2003' ),
(1006, 'JAHNAVI PURI', 'FEMALE', 60, 11 , 'B', 'COMMERCE', 11/07/2008 ) ,
(1007,'SANAM KUMAR', 'MALE', 23, 12, 'F', 'COMMERCE', '03/08/1998' ),
(1008, 'SAHIL SARAS', 'MALE', 56, 11, 'C', 'COMMERCE', '11/07/2008' ),
(1009, 'AKSHARA AGRAWAL', 'FEMALE', 72,12, 'B', 'COMMERCE', '10/01/1996' ),
(1010, 'STUTI MISHRA' , 'FEMALE', 39,11, 'F', 'SCIENCE',  '23/11/2008' ),
(1011, 'HARSH AGRAWAL', 'MALE', 42, 11 , 'C', 'SCIENCE' , '3/8/1998' ),
(1012 , 'NIKUNJ AGRAWAL', 'MALE' , 49, 12, 'C', 'COMMERCE' , '28/06/1998' ),
(1013 , 'AKRITI SAXENA', 'FEMALE' , 89, 12, 'A', 'SCIENCE' , '11/23/2008' ),
(1014 , 'TANI RASTOGI', 'FEMALE' , 89, 12, 'A', 'SCIENCE' , '11/23/2008' );

-- 1. To display all the records form STUDENT table. SELECT * FROM student
SELECT * FROM SCHOOL.STUDENT ;
--   2. To display any name and date of birth from the table STUDENT. SELECT StdName, DOB  FROM student ;
SELECT STD_NAME , DOB FROM STUDENT  ;

-- 3. To display all students record where percentage is greater of equal to 80 FROM student table. 
SELECT * FROM STUDENT WHERE PERCENTAGE >= 80 ;

-- 4. To display student name, stream and percentage where percentage of student is more than 80
SELECT STD_NAME, STREAMM , PERCENTAGE FROM STUDENT WHERE PERCENTAGE > 80 ;

-- 5. To display all records of science students whose percentage is more than 75 form student table. 
SELECT *  FROM STUDENT WHERE  PERCENTAGE > 75  AND STREAMM LIKE 'SCIENCE' ;

--  -----------------------------END -----------------------------------
