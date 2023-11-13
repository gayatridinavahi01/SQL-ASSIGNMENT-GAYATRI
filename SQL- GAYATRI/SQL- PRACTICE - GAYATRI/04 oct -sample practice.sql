use hr ;

select * from employees ;

update employees 
set manager_name = " " 
where employee_id <> 100 ;

use hr;

 select * from employees   ;
 update employees 
 set manager_name =
 case
when manager_id = 100  then  ' Steven King'
when manager_id = 101 then  'Neena Kochchar '
when manager_id = 102 then  'Lex  De Haan '
when manager_id = 103 then 'Alexander Hunold '
when manager_id = 104 then 'Bruce Ernst '
when manager_id = 105 then ' David Austin '   
when manager_id = 108 then  'Nancy Greenberg'
when manager_id = 114 then  'Den Raphaely'
when manager_id = 120 then  'Matthew Weiss'
when manager_id = 121 then  'Adam Fripp'
when manager_id = 122 then  'Payam Kaufling'
when manager_id = 123 then  'Shanta Vollman'
when manager_id = 124 then  'Kevin Mourgos'
when manager_id = 145 then  'John Russell'
when manager_id =  146 then  'Karen Partners'
when manager_id = 147  then  'Alberto Errazur'
when manager_id = 148 then  'Gerald Cambrault'
when manager_id = 149 then  'Eleni Zlotkey'
when manager_id = 201 then  'Michael Hartstein'
when manager_id = 205  then  'Shelley Higgins'
 
   else ' '
   end ;
 
select * from employees ;
select * from employees  where manager_id = 201 ;



select date(now())  + interval 7 day; -- date equal to 7 days after today
select date(now()) - interval 7 day ; -- date equal to 7 days before today

select dayofweek( current_date())   +1    ;




select date_format( '2023-10-11', '%d  %M , %Y' );

-- ----------------------------------------------------------------------------------------------------------------

--  MY NAME IS GAYATRI 
SELECT  substring_index( 'MY NAME IS GAYATRI' ,  ' ', 3) ;
select substring_index(
substring_index( 'MY NAME IS GAYATRI' ,  ' ', 3) ,
' ' ,
-2
);

-- 
select cieling(pie) ;

   SELECT DISTINCT e.job_id, d.department_id, L.city AS location_city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations L ON d.location_id = L.location_id
WHERE d.department_id = 40; -- sir's solution
 
 
 --
