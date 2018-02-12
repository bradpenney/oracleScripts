/* 
Author: Brad Penney
Purpose: Shows frequency of log switches
*/

SPOOL /bkuprecScripts/auditLogs/logSwitchFrequency.log append;
SHOW USER
SELECT SYSDATE FROM dual;
SELECT NAME FROM v$database;

SELECT count(1), to_char(first_time,'YYYY:MM:DD:HH24') 
	FROM v$log_history
	GROUP BY to_char(first_time,'YYYY:MM:DD:HH24')
	ORDER BY 2;

SPOOL OFF;
