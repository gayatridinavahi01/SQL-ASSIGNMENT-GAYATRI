-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  STRING FUNCTIONS PRACTICE XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

select ascii('a') ;
select ascii('A');
select bin(2); --  RETURNS THE BINARY SYSTEM NUMBER EQUAVALENT TO DECIMAL SYSTEM NUMBER
select bit_length() ; -- dont understand this 
select char(123); -- dont understand this
select char_length('gayatri') ; -- RETURNS THE NUMBER OF CHARACTERS IN A WORD
select character_length('GAYATRI') ; -- RETURNS THE NUMBER OF CHARACTERS IN A WORD   (  SYNONYMOUS TO CHAR_LENGTH()  )
select concat('My', '  ', 'name', '  ','is', '__________' ) "RETURNS CONCATINATED STRING OR COMBINES ALL THE STRINGS" ;
select concat_ws('-' , 'my', 'name', 'is');
select elt( 3 , 'Aa', 'Bb', 'Cc', 'Dd'); --  RETURNS THE NTH ELEMENT OF THE LIST OF  STRINGS;
 
 
 
 select datediff(curdate() , '1987-07-30' ) ; --  NUMBER OF DAYS I HAVE SPENT ON THE EARTH
 select datediff(curdate() , '1987-07-30' ) /30 ;
 
 select  floor( datediff(curdate() , '1987-07-30' ) /365)  ; --  NUMBER OF YEARS I HAVE SPENT ON THE EARTH
 select floor((datediff(current_date(), '1987-07-30') %365 ) / 30 )  ;  -- NUMBER OF MONTHS I HAVE SPENT ON EARTH AFTER FULL YEARS
 select datediff( current_date(), '1987-07-30')%30  ; 
 --  SKANDA EESHAAN ---
 select datediff(curdate() , '2021-03-26' ) ;
 select floor( datediff(curdate() , '2021-03-26' )/ 365)  ; --  NUMBER OF FULL YEARS SPENT ON EARTH
 select  FLOOR( (datediff(curdate() , '2021-03-26' ) % 365) / 30) ; -- NUMBER OF MONTHS SPENT ON EARTH AFTER FULL YEARS
 select   datediff(curdate() , '2021-03-26' )  % 30;
	
-- GAYATRI PINNI --
select datediff(curdate() , '1987-07-30' ) ;
select datediff('2022-02-02' , '2021-03-16') ;
select floor(datediff('2022-02-02' , '2021-03-16') / 365 ) " years ";
select FLOOR(( datediff('2022-02-02' , '2021-03-16') % 365 ) /30 ) " MONTHS " ;
select datediff('2022-02-02' , '2021-03-16') % 30  " DAYS "; 

SELECT 
CONCAT(
floor(datediff('2022-02-02' , '2021-03-16') / 365 ) , " YEARS " ,
FLOOR(( datediff('2022-02-02' , '2021-03-16') % 365 ) /30 ) , " MONTHS ",
datediff('2022-02-02' , '2021-03-16') % 30  , " DAYS "
)   " MY  VERY SHORT TENURE IN AL KAUN TELECOMS  :( " ; 


select sysdate() ;
select now() ;
select current_timestamp() ;

select hex( 13230);
select insert( 'ABCDEFGHIJKLMNOP' , 3, 2, 'Z' ) ;

SELECT instr( 'ABCDEFGGGGGHIJKLMNOPQRSTUVWXYZ', 'G')   ;

SELECT LEFT('ABCDEFGHIJKLMNOPQRSTUVWXYZ' , 7 ) ;
SELECT LENGTH('ABCDEFGHIJKLMNOPQRSTUVWXYZ')  ;
SELECT load_file("D:\TOPS TECHNOLOGY\SQL - ASSESSMENT - GAYATRI\ASSESSMENT-1- GAYATRI.sql") ;

SELECT INSTR('ABCDEFGHIJKLMNOPQRSTUVWXYZ' , 'G') ;
SELECT locate('G' , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ;
SELECT POSITION( 'G' IN 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ;

SELECT LOWER('aA') ;
SELECT LCASE('aA');

SELECT UPPER('bB');
SELECT UCASE('bB') ;

SELECT LPAD('HI',7 , '_/!');
SELECT LPAD('HI', 1 , '/-#') ;


SET @STR = BINARY 'NEW YORK' ;
SELECT LOWER(@STR) ;
SELECT LOWER( CONVERT(@STR  USING utf8mb4) );

SELECT LTRIM('   ABCDEFGHIJKLMNOPQRSTUVWXYZ') ;
SELECT RTRIM('             ABCDEFGHIJKLMNOPQRSTUVWXYZ       ');

SELECT MAKE_SET(3, 'A','B','C'); --  HAVE TO UNDERSTAND THIS 



SELECT MID('ABCDEFGHIJKLMNOPQRSTUVWXYZ' ,  15 , 3) ;
SELECT substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 15, 3) ;


SELECT length('ABCDEFGHIJKLMNOPQRSTUVWXYZ');


SELECT instr('GAYATRI' , 'T') ;
SELECT LOCATE('T',  'GAYATRI') ;
SELECT POSITION('T' IN 'GAYATRI') ;

SELECT REPEAT('JAI SHREE RAM ' , 3);

SELECT REPLACE('NEENA' , 'N' , 'M') ;

SELECT REVERSE('ABCDEFGHIJKLMNOPQRSTUVWXYZ');

SELECT REVERSE('MALAYALAM') ;

SELECT RIGHT('ABCDEFGHIJKLMNOPQRSTUVWXYZ' , 4) ;
SELECT left('ABCDEFGHIJKLMNOPQRSTUVWXYZ' , 4) ;

SELECT CONCAT(
SPACE(10),' HELLO' 
) ;

SELECT substr( 'GAYATRI' , 1,1 ) ; --  G  
SELECT substr('GAYATRI' , 5) ; --  TRI
SELECT substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ'   FROM 10) ;

--  substring() uses 

select substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 5) ;
select substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ' from 5) ;
select substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ' , 5 ,10) ;
select substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ' , -3) ;
select substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ' , -5, 3) ; 
select substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ' from -5 for 3);

-- SUBSTRING_INDEX()
select substring_index('www.google.com' , '.',2 ) ;
select substring_index('AMAN RAJ DAS' ,' ' , 3) ; -- full name
select substring_index('AMAN RAJ DAS' , ' ', -2 ) ;  -- RAJ DAS
select substring_index('AMAN RAJ DAS' , ' ' , 2) ; -- AMAN RAJ

select substring_index('WWW.GOOGLE.COM' ,'.' , 3 ) ;
select substring_index('WWW.GOOGLE.COM' ,'.' , 2) ;
select substring_index('WWW.GOOGLE.COM' ,'.' , -2) ;

--  TRIMMING OF STRING
select TRIM('   GAYATRI    ');
select LTRIM('   GAYATRI    ');
select  RTRIM('   GAYATRI    ') ;

select TRIM(LEADING '-' from '----------------GAYATRI----------');
select TRIM(TRAILING '-' from '----------------GAYATRI----------' );
select TRIM(BOTH '-' from '----------------GAYATRI----------' ) ;


SELECT CHARACTER_LENGTH('GAYATRI DINAVAHI') ;
select concat_ws( '- ' , 'GAYATRI ' , 'SUBRAHMANYAM ' , 'BALA ' , 'DINAVAHI') ;
SELECT FIELD('A' , 'GAYATRI', 'DINAVAHI', 'SUBRAHAMANYAM' , 'AAAAAA' , 'A') ;

SELECT INSTR( 'GAYATRI', 'A' ) ;
SELECT locate('A' , 'GAYATRI') ;
SELECT POSITION('A' IN 'GAYATRI' )  ;

SELECT FIELD( 'GAYATRI' ,       'MY' , 'NAME' , 'IS', 'Gayatri') ;