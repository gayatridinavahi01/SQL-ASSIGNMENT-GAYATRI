use org ;
select * from order1 ;
select * from bonus ;
select *  from title ;
select * from worker ;

-- 1) 
select max(salary) , monthname(joining_date) from worker group by monthname(joining_date) ;

select * from worker order by rand();

select * from worker ;

insert into worker values
(9, 'Gayatri', 'Dinavahi' , 44000, '2023-10-25 09:00:00', 'Admin');

select sum(salary) , manager_id  from employees group by manager_id ;


USE HR;
SELECT * FROM EMPLOYEES;
SELECT SALARY ,  DEPARTMENT_ID, MANAGER_ID FROM EMPLOYEES 
WHERE  
(SELECT 
SUBSTRING_INDEX( 
SUBSTRING_INDEX (MANAGER_NAME , ' ', 3) , 
' ', -1 )
 FROM EMPLOYEES )  LIKE '_A%' ; 


SELECT SUBSTRING_INDEX( 
SUBSTRING_INDEX (MANAGER_NAME , ' ', 3) , ' ', -1)
 FROM EMPLOYEES ;
 
 
 SELECT AVG(A.SALARY) FROM EMPLOYEES A 
 WHERE A.SALARY  IN 
 (
 SELECT SUM(B.SALARY)  FROM EMPLOYEES B GROUP BY B.DEPARTMENT_ID 
 ); --  AVERAGE OF   (SUM OF DEPARTMENTWISE SALARIES)
 
 USE HR;
 SELECT SUM(B.SALARY)  FROM EMPLOYEES B GROUP BY B.DEPARTMENT_ID ;
 
 
 
 -- MY NAME IS SACHIN  RAMESH TENDULKAR 
SELECT
substring_index(
substring_index( 'MY NAME IS SACHIN TENDULKAR', ' ', 4) ,
' ', 1) ;
 

SELECT 
substring_index(
SUBSTRING_INDEX('AMAN RAJ DAS' , ' ' , 3) ,
' ', -1
) " DISPLAY DAS ";  

SELECT * FROM EMPLOYEES;

SELECT 
SUBSTRAING_INDEX(
SUBSTRAING_INDEX(STREET_ADDRESS , ' ' , 2),
' ', -1 ) 
FROM LOCATIONS;

SELECT STREET_ADDRESS FROM LOCATIONS ;
SELECT 
SUBSTRING_INDEX(
SUBSTRING_INDEX(STREET_ADDRESS , ' ', 2) , ' ', -1)
FROM LOCATIONS ;

create INDEX IDX1 ON TABLE_NAME(COL_NAME) ;
SELECT * FROM TABLE_NAME USE index (IDX1) ;


-- GRANT SELECT , UPDATE ON TABLE_NAME  TO USER1, USER2 ;

 -- REVOKE SELECT , UPDATE ON TABLE_NAME  FROM USER1, USER2 ;

