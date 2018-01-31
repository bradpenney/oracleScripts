/* 
Author: Brad Penney, January 2018
Create expchinook user to import database
*/

SPOOL /bkuprecScripts/auditLogs/createEXPCHINOOK.log append;
SET ECHO ON
SHOW USER
SELECT SYSDATE FROM dual;
SELECT NAME FROM v$database;

/* Create User */
CREATE USER expchinook
IDENTIFIED BY chinook
DEFAULT TABLESPACE CHINOOK_data
TEMPORARY TABLESPACE temp
QUOTA 200M ON users
PASSWORD EXPIRE;

GRANT connect to expchinook;
GRANT resource to expchinook;
GRANT create session TO expchinook;
GRANT create table TO expchinook;
GRANT create view TO expchinook;

SPOOL OFF;
