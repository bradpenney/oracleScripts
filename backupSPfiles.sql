/*
Author: Brad Penney
Purpose: Creating Backups of SPFiles

*/

SPOOL /bkuprecScripts/auditLogs/createSPFile.log append;
SHOW USER
SELECT SYSDATE FROM dual;
SELECT NAME FROM v$database;

-- Creates pfile from spfile
CREATE pfile='/u02/pfile_backup/pfile_backup.ora' from spfile;

SPOOL off;
