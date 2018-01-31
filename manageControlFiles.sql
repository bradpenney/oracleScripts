/*
Author: Brad Penney
Purpose: Managing Control Files 

Commands are commented out until used.
*/

SPOOL /bkuprecScripts/auditLogs/manageControlFiles.log append;
SHOW USER
SELECT SYSDATE FROM dual;
SELECT NAME FROM v$database;

-- Shows name, type and value of control_files
DESCRIBE v$controlfile_record_section;

-- Shows the location and name of control files
--SHOW parameter control_files;

-- Shows name, mode, when created, and scn of current database
--SELECT name, open_mode, created, current_scn FROM v$database;

-- Shows columns in control file table
--DESCRIBE v$controlfile;

-- Shows inst_id, name, value
--DESCRIBE v$diag_info;

-- Shows rows 
--SELECT name FROM v$diag_info;

SPOOL off;
