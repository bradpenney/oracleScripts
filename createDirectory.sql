* 
Author: Brad Penney, January 2018
Create directory to house Chinook Schema Import
*/

SPOOL /bkuprecScripts/auditLogs/createDirectory.log append;
SET ECHO ON
SHOW USER
SELECT SYSDATE FROM dual;
SELECT NAME FROM v$database;

CREATE OR REPLACE DIRECTORY chinookIMP AS '/u02/chinookBackup';
GRANT READ, WRITE ON DIRECTORY chinookIMP TO expchinook;


SPOOL OFF;
