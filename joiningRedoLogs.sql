/*
Author: Brad Penney
Purpose: Show Redo Log Locations
*/

SELECT a.group#, a.thread#, a.status, a.bytes, a.archived, b.member, b.status
	FROM v$log a 
	JOIN v$logfile b on a.group# = b.group#
	ORDER BY a.thread#, b.group#, b.member;
