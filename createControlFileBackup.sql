/*
Author: Brad Penney
Purpose: Creating Backups of Control Files 

*/

SPOOL /bkuprecScripts/auditLogs/createControlFileBackup.log append;
SHOW USER
SELECT SYSDATE FROM dual;
SELECT NAME FROM v$database;

-- Creates a controlfile backup in trace
ALTER database backup controlfile to trace;

-- Produce SQL statements that can be later used to recreate control file
ALTER database backup controlfile to '/u02/control_file_backup/control_backup_2018Jan31945';

SPOOL off;
