/* 
Author: Brad Penney, January 2018
Alter tablespaces to add datafile to Chinook_idx
*/

SPOOL /bkuprecScripts/auditLogs/alter_tablespaces.log append;
SET ECHO ON
SHOW USER
SELECT SYSDATE FROM dual;
SELECT NAME FROM v$database;

-- Alter tablespace Chinook_idx, add datafile
--ALTER TABLESPACE CHINOOK_idx
--ADD DATAFILE '/u03/bkuprec/CHINOOK_idx01.dbf' SIZE 50M;

-- Make tablespace read only
-- ALTER TABLESPACE Chinook_idx read only;

-- Make tablespace writeable
-- ALTER TABLESPACE Chinook_idx read write;

-- Turn off logging
--ALTER TABLESPACE Chinook_idx nologging;

-- Turn off logging
--ALTER TABLESPACE Chinook_idx logging;


SPOOL off;
