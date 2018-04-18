/* 
Author: Brad Penney, February 2018
Purpose: Analyse the effectiveness of an index

TO ANALYSE THE EFFECTIVENESS OF THE INDEX:
    1.) RUN AN EXPLAIN PLAN ON A QUERY THAT USES THE INDEX
    2.) TAKE A COPY OF THE DDL OF THE INDEX
    3.) DROP THE INDEX -- DROP INDEX <tableName>;
    4.) RE-RUN THE EXPLAIN PLAN AND COMPARE THE RESULTS
    
*/

SPOOL /bkuprecScripts/auditLogs/explainPlan.log append;
SET ECHO ON
SHOW USER
SELECT SYSDATE FROM dual;
SELECT NAME FROM v$database;

--==========================================================
-- THIS SECTION SHOWS DETAILS ABOUT THE ENVIRONMENT

-- Show the tables available to the user
SELECT * FROM user_tables;

-- Shows index names on the sales_report tables
SELECT index_name, table_name 
FROM user_indexes 
WHERE table_name in ( 'SALES_REPORT'); 

-- Shows index columns names on the EMPLOYEES table
SELECT table_name, index_name, column_name, column_position 
FROM user_ind_columns where table_name IN ( 'SALES_REPORT') 
ORDER BY index_name; 

--==========================================================
-- THIS SECTION GENERATES EXPLAIN PLAN

-- Sample Query that will utilize the index
SELECT productcategory 
FROM SALES_REPORT 
WHERE PRODUCTCATEGORY = 'other';

-- Create an explain plan bassed on the sample query
EXPLAIN PLAN FOR
    SELECT productcategory 
    FROM SALES_REPORT 
    WHERE PRODUCTCATEGORY = 'other';
    
-- View the explain plan that was generated
SELECT * FROM table(DBMS_XPLAN.DISPLAY);

SPOOL OFF;
