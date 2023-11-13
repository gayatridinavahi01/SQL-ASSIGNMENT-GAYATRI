 CREATE DATABASE PRACTICE5 ;
 USE PRACTICE5 ;
 
 create Table Salesman
 (
 Salesman_id int ,
 Salesman_name varchar(20),
 City Varchar(20) ,
 Commission Decimal(2,2)
 );
 
 ALTER TABLE SALESMAN
 ADD CONSTRAINT PRIMARY KEY (SALESMAN_ID)  ;
 
 ALTER TABLE SALESMAN
 ADD COLUMN SALES_AMOUNT INT,
 ADD COLUMN SALESMAN_PH  INT(12) ;
 
 SELECT * FROM SALESMAN ;
 
 ALTER TABLE SALESMAN 
 DROP COLUMN SALESMAN_PH ;
 
 ALTER TABLE SALESMAN 
 DROP COLUMN SALES_AMOUNT ;
 
 INSERT INTO SALESMAN VALUES 
 (5001, 'James Hoong' , 'New York' , 0.15) ;
 INSERT INTO SALESMAN VALUE 
 (5002, 'Nail Knite' , 'Paris' , 0.13 ),
 (5003, 'Lauson Hen', 'San Jose', 0.12 ),
 (5005 , 'Pit Alex' , 'London' , 0.11   ),
 (5006 , 'Mc Lyon' ,  'Paris' , 0.14    ),
 (5007, 'Paul Adam' , 'Rome' , 0.13);
 
CREATE TABLE CUSTOMER
(
customer_id int ,
cust_name varchar(25) ,
city varchar(30) ,
grade int ,
salesman_id int,

primary key(customer_id) ,
foreign key(salesman_id)  references Salesman(salesman_id)
);

select * from customer ;

insert into customer values 
(3001, 'Brad Guzan' , 'London' , null, 5005),
(3002, 'Nick Rimado' , 'New York' , 100 , 5001 ),
(3003 , 'Jozy Altidor' , 'Moscow' , 200,  5007),
(3004 , 'Fabian Johnson' , 'Paris' , 300 , 5006),
(3005 , 'Graham Zusi' , 'California' , 200 , 5002),
(3007, 'Brad Davis' , 'New York' , 200, 5001),
(3008 , 'Julian Green' , 'London' , 300 , 5002),
(3009, 'Geoff Cameron' , 'Berlin' , 100, 5003) ;
select * from customer ;
select * from salesman ;

select S.salesman_id , S.salesman_name, S.city, C.customer_id , C.cust_name 
		from Salesman S right join Customer C 
        on S.city = C.city ;

create table orders 
(
Order_id int, purchase_amount int, ord_date Date ,
Customer_id int , Salesman_id int,
primary key (order_id) ,
foreign key(customer_id)  references Customer(Customer_id),
foreign key (salesman_id)  references Salesman(salesman_id)
);
select * from orders ;

insert into Orders values 
(70001, 150.5 , '2012-10-05' , 3005, 5002) ,
(70002, 65.26, '2012-10-05' , 3002, 5001) ,
(70003, 2480.4 , '2012-10-10' , 3009 , 5003) ,
(70004 ,110.5 , '2012-08-17' , 3009 , 5003   ) ,
(70005 , 2400.6, '2012-07-27' , 3007,5001    ) ,
(70007, 948.5 , '2012-09-10' , 3005 , 5002	) ,
(70008 , 5760 , '2012-09-10', 3002 , 5001   ) ,
( 70009 , 270.65, '2012-09-10' , 3001, 5005 ) ;
insert into orders values 
(70010 , 1983.43 , '2012-10-10' ,3004, 5006),
(70011 , 75.29 ,'2012-08-17' , 3003, 5007 ),
(70012, 250.45 , '2012-06-17' , 3008, 5002),
(70013, 3045.6 , '2012-04-25' , 3002 ,5001 ) ;

select * from orders  ;
SELECT * FROM CUSTOMER ;
SELECT O.ORDER_ID , O.PURCHASE_AMOUNT, C.CUST_NAME , C.CITY 
	FROM ORDERS O   JOIN  CUSTOMER C 
    ON O.CUSTOMER_ID = C.CUSTOMER_ID 
    WHERE O.PURCHASE_AMOUNT BETWEEN 500 AND 2000 ;
--  --------------------------------------------------------------------------------------------
select * from customer ;
select * from salesman ;
SELECT   C.CUST_NAME ,   C.CITY , S.SALESMAN_NAME , S.COMMISSION 
	FROM CUSTOMER C JOIN SALESMAN S 
    ON C.SALESMAN_ID = S.SALESMAN_ID
    AND S.COMMISSION  > 0.12 ;
    
-- -----------------------

SELECT * FROM ORDERS  ;
SELECT * FROM CUSTOMER ;
SELECT * FROM SALESMAN ;

SELECT O.ORDER_ID , O.ORD_DATE , O.PURCHASE_AMOUNT, C.CUST_NAME , C.GRADE, S.SALESMAN_NAME , S.COMMISSION
	FROM ORDERS O JOIN CUSTOMER C  ON O.CUSTOMER_ID  = C.CUSTOMER_ID 
    JOIN SALESMAN S ON C.SALESMAN_ID = S.SALESMAN_ID ;
    
-- ------------------------------------------------------------------------------------
SELECT * FROM SALESMAN ;
SELECT * FROM ORDERS ;
SELECT * FROM CUSTOMER ;

SELECT O.CUSTOMER_ID , S.SALESMAN_ID , O.SALESMAN_ID , S.COMMISSION,S.CITY, 
 C.CUSTOMER_ID 
 FROM CUSTOMER C JOIN SALESMAN  S ON C.SALESMAN_ID  = S.SALESMAN_ID
 JOIN ORDERS O  ON C.CUSTOMER_ID = O.CUSTOMER_ID  AND S.SALESMAN_ID  = O.SALESMAN_ID ;

SELECT * FROM SALESMAN ;
USE HR ;

SELECT  YEAR(HIRE_DATE) , T.* FROM 
			(
            SELECT * ,  (
							DENSE_RANK( ) OVER ( PARTITION BY YEAR(HIRE_DATE) ORDER BY DEPARTMENT_ID DESC ) 
						)  "RANK_NUM"  
FROM EMPLOYEES ) AS T 
WHERE RANK_NUM =3;	
    
select  * FROM 
		( SELECT  E.* , D.* ,  DENSE_RANK() OVER(ORDER BY SALARY DESC) "RN"
        FROM EMPLOYEES E  INNER  JOIN DEPARTMENTS D 
		ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 
		ORDER BY EMPLOYEE_ID ASC)  AS T;
    
    
SELECT * FROM 
( SELECT E.* , d.DEPARTMENT_NAME,  DENSE_RANK()  OVER(ORDER BY SALARY ASC)  "rn"   
 FROM EMPLOYEES E INNER JOIN DEPARTMENTS D 
 on e.department_id  = d.department_id
 )  AS T 
 where   T.rn  = 10 ;
 
 
USE HR ;
SELECT E.FIRST_NAME , E.SALARY FROM EMPLPOYEES  E
ORDER BY E.SALARY DESC LIMIT 3 ;

SELECT 	T.*  FROM
	(SELECT * , 
    DENSE_RANK() OVER( ORDER BY SALARY DESC ) "RN"  FROM EMPLOYEES 
    ) AS T  
WHERE T.RN = 6;
    
    
SELECT DISTINCT(T2.RN ) , T2.SALARY FROM
(
    
SELECT T.FIRST_NAME , T.LAST_NAME , T.SALARY , T.DEPT_RANK_NUM  "RN"  FROM 
	(SELECT * , DENSE_RANK() OVER (ORDER BY DEPARTMENT_ID ASC )  "DEPT_RANK_NUM"   FROM EMPLOYEES ) AS T
WHERE  T.DEPT_RANK_NUM = 4 
    
)    AS T2;
    
use hr ;
SELECT * FROM EMPLOYEES ;
SELECT * FROM EMPLOYEES  WHERE  JOB_ID LIKE '%SA%' ;
CREATE VIEW V1_SALES_DEPARTMENT AS
SELECT * FROM EMPLOYEES   WHERE  JOB_ID LIKE '%SA%' ;


SELECT * FROM EMPLOYEES WHERE JOB_ID LIKE '%FI%'; 
SELECT  * FROM  V1_SALES_DEPARTMENT ;
DROP VIEW V2_FINANCE_DEPARTMENT  ;
CREATE VIEW V2_FINANCE_DEPARTMENT AS 
SELECT * FROM EMPLOYEES WHERE JOB_ID LIKE '%FI%';


SELECT * FROM V2_FINANCE_DEPARTMENT  ;

CREATE VIEW V3 AS 
SELECT * FROM EMPLOYEES WHERE  EMPLOYEE_ID =100 WITH CHECK OPTION;

SELECT * FROM V3 ;

SELECT * FROM JOB_HISTORY
WHERE START_DATE <= sysdate()  - (2*365) ;

SELECT SYSDATE() ; 
SELECT current_TIMESTAMP() ;

SELECT CONCAT( floor(1000/365) , ' YEARS  ' , floor(1000%365/30) , '  MONTHS  ' , 1000 % 30 , '  days')  as age;


select * from employees ;

select * from 
	(select first_name , last_name , salary , department_id from employees ) as T ;

SELECT * FROM 
( SELECT FIRST_NAME , LAST_NAME , SALARY ,  DEPARTMENT_ID , DENSE_RANK() OVER(   ORDER BY DEPARTMENT_ID DESC ) "DEPT_RANK" FROM EMPLOYEES  ) AS E1 
WHERE DEPT_RANK = 3 ;

SELECT *  FROM 
	EMPLOYEES E right  JOIN DEPARTMENTS D 
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID  ;


use org;
SELECT * FROM ORDER1;
SELECT * FROM BONUS;
SELECT * FROM WORKER;

SELECT W.* , B.BONUS_AMOUNT FROM WORKER W LEFT JOIN BONUS B
ON W.WORKER_ID  = B.WORKER_REF_ID 
WHERE W.SALARY > 50000 ;


