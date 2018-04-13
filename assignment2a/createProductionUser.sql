/* 
Author: Brad Penney, April 2018
Create production user
*/

SPOOL /bkuprecScripts/auditLogs/assignment2a/createProductionUser.log append;
SET ECHO ON
SHOW USER
SELECT SYSDATE FROM dual;
SELECT NAME FROM v$database;

/* Create User */
CREATE USER production
IDENTIFIED BY student
DEFAULT TABLESPACE PRODUCTION_DATA
TEMPORARY TABLESPACE temp
QUOTA 200M ON users
PASSWORD EXPIRE;

GRANT connect to production;
GRANT resource to production;
GRANT create session TO production;
GRANT create table TO production;
GRANT create view TO production;
GRANT create materialized view to load_staging;

SPOOL OFF;
