/* 
Author: Brad Penney, January 2018
Create tablespaces to house Chinook Schema
*/

SPOOL /bkuprecScripts/auditLogs/create_tablespaces.log append;
SET ECHO ON
SHOW USER
SELECT SYSDATE FROM dual;
SELECT NAME FROM v$database;

-- Create tablespace for Chinook data
CREATE TABLESPACE CHINOOK_data
DATAFILE '/u02/bkuprec/CHINOOK_data.dbf' SIZE 50M; 

-- Create tablespace for indexes
CREATE TABLESPACE CHINOOK_idx
DATAFILE '/u03/bkuprec/CHINOOK_idx.dbf' SIZE 50M;

SPOOL off;
