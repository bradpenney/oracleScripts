/*
Author: Brad Penney
Purpose: Decrease Memory Target

*/

SPOOL /bkuprecScripts/auditLogs/decreaseMemoryTarget.log append;
SET ECHO ON;
SHOW USER;
SELECT SYSDATE FROM dual;
SELECT NAME FROM v$database;

-- Create a pfile backup of existing spfile - RUN THIS FIRST!
-- CREATE pfile='/u02/pfile_backup/pfile_backup01.ora' from spfile;

-- Show the existing memory parameter
-- SHOW PARAMETER memory;

-- Check to see if parameter is static or dynamic
-- Dynamic if result is "immediate", static if result is "false"
-- SELECT NAME, VALUE, ISSYS_MODIFIABLE FROM V$PARAMETER WHERE NAME = 'memory_target';
-- SELECT NAME, VALUE, ISSYS_MODIFIABLE FROM V$PARAMETER WHERE NAME = 'memory_max_target';

-- Alter the memory_target parameter down to 500MB 
-- ALTER SYSTEM SET memory_target=500m scope=spfile;

-- Alter the memory_max_target parameter down to 500MB
-- ALTER SYSTEM SET memory_max_target=500m scope=spfile;

-- SHUT DOWN DATABASE AND RESTART IT IN ORDER FOR THE MEMORY PARAMETERS TO BE RESET

SPOOL off;
