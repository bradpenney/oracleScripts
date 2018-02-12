/* 
Author: Brad Penney, February 2018
Create Tablespaces
*/

SPOOL /bkuprecScripts/auditLogs/create_tablespaces.log append;
SET ECHO ON
SHOW USER
SELECT SYSDATE FROM dual;
SELECT NAME FROM v$database;

-- Create tablespace for TOOLS_DATA
CREATE TABLESPACE TOOLS_DATA
DATAFILE '/u02/bkuprec/TOOLS_DATA_01.dbf' SIZE 50M,
         '/u02/bkuprec/TOOLS_DATA_02.dbf' SIZE 50M;

-- Create tablespace for TOOLS_IND
CREATE TABLESPACE TOOLS_IND
DATAFILE '/u02/bkuprec/TOOLS_IND_01.dbf' SIZE 50M,
         '/u02/bkuprec/TOOLS_IND_02.dbf' SIZE 50M;

SPOOL off;
