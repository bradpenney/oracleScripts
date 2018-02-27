/* 
Author: Brad Penney, February 2018
Purpose: Insert Data from one table to another
*/

SPOOL /bkuprecScripts/auditLogs/insertIntoTableFromTable.log append;
SET ECHO ON
SHOW USER
SELECT SYSDATE FROM dual;

-- Select data from one table and insert it into another (partitioned) table
INSERT INTO invoice_part
    SELECT * FROM invoice;
    
SELECT COUNT(*) FROM invoice;
SELECT COUNT(*) FROM invoice_part;

SPOOL off;
