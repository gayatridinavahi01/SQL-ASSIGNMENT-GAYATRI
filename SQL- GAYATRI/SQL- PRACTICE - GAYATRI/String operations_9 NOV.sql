use hr ;

select  first_name , hire_date , date_format(hire_date, '%M') from employees;

select employee_id , first_name , last_name , hire_date , monthname(hire_date) from employees ;

select * from 
		(
        select * , dense_rank() over (order by salary desc) as Rank_salary_desc from employees 
        ) as T 
where Rank_salary_desc = 6 ;

select extract( month from curdate()) ;
select substring( 'GAYATRI' , 3 ) "SUBSTRING  EXAMPLE";
SELECT  SUBSTRING('GAYATRI' , 3, length('GAYATRI')-3  )  AS " SUBSTRING EXAMPLE";

SELECT LEFT('GAYATRI', 4) ;
SELECT  right('GAYATRI' , 3) ;

SELECT TRIM( '    MY NAME IS GAYATRI       ' );
SELECT REPLACE('MY NAME IS GAYATRI DINAVAHI' , ' ', '_');

SELECT CONCAT(FIRST_NAME , ' ', LAST_NAME) AS  "FULL NAME" FROM EMPLOYEES ;
SELECT RTRIM('GAYATRI      ') ;
SELECT LTRIM('      GAYATRI');

SELECT INSERT('MY NAME IS GAYATRI', 3,3,'XXX') ;
SELECT MID('GAYATRI', 3,2) ;

--    SYNONYM OF FINDING CHARACTER IN A STRING
SELECT LOCATE('A','GAYATRI' ) ;
SELECT position('A' IN 'GAYATRI') ;
SELECT instr('GAYATRI' , 'A') ;
SELECT LOCATE('GAYATRI' , 'MY NAME IS GAYATRI' )  ;
SELECT POSITION( 'GAYATRI' IN  'MY NAME IS GAYATRI' ) ;
SELECT instr( 'MY NAME IS GAYATRI' , 'GAYATRI') ;

-- SYNONYM OF NUMBER OF CHARACTERS
SELECT char_length('I AM GAYATRI') ;
SELECT LENGTH('I AM GAYATRI') ;
-- SYNONYM FUNCTIONS FOR COMBINING STRINGS
SELECT CONCAT(FIRST_NAME , '_' , LAST_NAME)  AS "FULL NAME" FROM EMPLOYEES ;
SELECT concat_ws( '_' , FIRST_NAME , LAST_NAME ) "FULL NAMW"  FROM EMPLOYEES ;

-- reversing the characters. USED FOR FINDING THE PALINDROMS
SELECT reverse('ABCDEFG') ; -- 
-- 
SELECT FORMAT(1234.5678 , 2);
SELECT convert('123' , SIGNED)  ; --  DID NOT UNDERSTAND

SELECT REPEAT('GAYATRI' , 3 ) ;

SELECT LPAD('GAYATRI', 10, '&') ;
SELECT LPAD('123', 5, 0) ;
SELECT RPAD('GAYATRI' , 10 , '$') ;
SELECT RPAD('123' , 5, '/') ;

-- REPLACE A CHARACTER/ S IN ENTIRE STRING WITH OTHER CHARACTER /s
SELECT REGEXP_REPLACE('GAYATRI' , 'A' , '_') ;
SELECT REGEXP_REPLACE('MY NAME IS GAYATRI' , 'A' , '_') ;
SELECT REGEXP_REPLACE('BETTY BAOUGHT A BITTER BUTTER' , 'TT' , '~')  ;

SELECT QUOTE('ITS IS A SAMPLE STRING') ;
SELECT LOCATE('GAYATRI' , 'MY NAME IS GAYATRI' )  ;

