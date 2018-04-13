/* 
Author: Brad Penney, April 2018
Create Production Tablespaces
*/

SPOOL /bkuprecScripts/auditLogs/assignment2a/createProductionTablespace.log append;
SET ECHO ON
SHOW USER
SELECT SYSDATE FROM dual;
SELECT NAME FROM v$database;

---- Create tablespace for PRODUCTION_DATA
CREATE TABLESPACE PRODUCTION_DATA
DATAFILE '/u02/bkuprec/PRODUCTION_DATA_01.dbf' SIZE 50M,
         '/u03/bkuprec/PRODUCTION_DATA_02.dbf' SIZE 50M;
--
---- Create tablespace for PRODUCTION_IND
CREATE TABLESPACE PRODUCTION_IND
DATAFILE '/u02/bkuprec/PRODUCTION_IND_01.dbf' SIZE 50M,
         '/u03/bkuprec/PRODUCTION_IND_02.dbf' SIZE 50M;
         
CREATE TABLESPACE PRODUCTION_VIEWS
DATAFILE '/u02/bkuprec/PRODUCTION_VIEWS_01.dbf' SIZE 50M,
         '/u03/bkuprec/PRODUCTION_VIEWS_02.dbf' SIZE 50M;

SPOOL off;
