/* 
Author: Brad Penney, February 2018
Purpose: Exploring User Constraints
*/


SPOOL /bkuprecScripts/auditLogs/userConstraints.log append;
SET ECHO ON
SHOW USER
SELECT SYSDATE FROM dual;

-- Show user constraints table 
--DESCRIBE user_constraints;

-- Show user constraints that are foreign or primary keys
SELECT constraint_name, table_name, r_constraint_name 
    FROM user_constraints
    WHERE constraint_name LIKE '%K_%';
    
SPOOL off;
