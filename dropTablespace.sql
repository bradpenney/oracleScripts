/* 
Author: Brad Penney, January 2018
Drop Tablespaces
*/

SPOOL /bkuprecScripts/auditLogs/drop_tablespaces.log append;
SET ECHO ON
SHOW USER
SELECT SYSDATE FROM dual;
SELECT NAME FROM v$database;

-- Drop tablespace as necessary
DROP TABLESPACE TOOLS_IND INCLUDING CONTENTS AND DATAFILES;

SPOOL off;