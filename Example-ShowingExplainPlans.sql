--**************************************************
-- THIS SCRIPT IS USED TO SHOW HOW EXPLAIN PLANS 
-- WORK IN ORACLE.
-- ENVIRONMENT:  HR, CHINOOK USER MUST BE SET UP
--   IN ORDER TO EXECUTE THE following SQL commands.
-- Privilege: grants access to the several dynamic performance views
--  must be executed by sys OR system
--**************************************************
grant select_catalog_role to hr; -- 

select * from user_tables;
===================================================================
--set up environment to be able to execute explain plans
===================================================================
truncate table plan_table;
===================================================================
--UNDERSTAND THE ENVIRONMENT THAT YOU ARE TUNING:
===================================================================
-- shows index names on the EMPLOYEES, DEPARTMENTS tables
select index_name, table_name from user_indexes where table_name in ( 'EMPLOYEES', 'DEPARTMENTS'); 

-- shows index columns names on the EMPLOYEES table
select table_name, index_name, column_name, column_position from user_ind_columns where table_name in ( 'EMPLOYEES', 'DEPARTMENTS') order by index_name; 

===================================================================
--- SAMPLE QUERY #1 THAT CAN BE EXECUTED: 
select * from employees e, departments d 
where e.department_id = d.department_id and e.first_name = 'Jennifer';
-- SAME AS ABOVE QUERY - Written in a different way:
select * from employees e 
JOIN departments d ON e.department_id = d.department_id 
where e.first_name = 'Jennifer';
===================================================================
--SAME QUERY #2: 
select * from departments d 
JOIN employees e ON d.department_id = e.department_id where e.first_name = 'Jennifer';

--drop index idx_emp 
create index idx_emp_name on employees (last_name, first_name);

--drop index emp_name_ix

=================================================================== 
--Extract the explain plan for a SQL statement
===================================================================
--FOR QUERY #1: 
--explain plan for select * from employees e, departments d where e.department_id = d.department_id and e.first_name = 'Jennifer';
explain plan for select * from employees e JOIN departments d ON e.department_id = d.department_id where e.first_name = 'Jennifer';

--FOR QUERY #2: 
explain plan for select * from departments d JOIN employees e ON d.department_id = e.department_id where e.first_name = 'Jennifer';

===================================================================
--DISPLAYS full plan table details
--desc dbms_xplan
===================================================================
--DISPLAY #1:
select * from table(dbms_xplan.display('PLAN_TABLE',NULL,'ADVANCED'));

--DISPLAY #2:
--get plan table details in a table display
-- Review PREDICATE information from the result based on WHERE CLAUSE
SELECT * FROM table(DBMS_XPLAN.DISPLAY);
