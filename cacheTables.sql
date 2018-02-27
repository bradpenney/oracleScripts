/* 
Author: Brad Penney, February 2018
Purpose: Cache table to improve performance
*/

SPOOL /bkuprecScripts/auditLogs/cacheTables.log append;
SET ECHO ON
SHOW USER
SELECT SYSDATE FROM dual;
SELECT NAME FROM v$database;

-- Alter table "genre" to cache it (improve performance)
ALTER TABLE expchinook.genre CACHE;

-- Confirm table was cached correctly
-- Source: https://mikesmithers.wordpress.com/2016/06/23/oracle-pinning-table-data-in-the-buffer-cache/
SELECT obj.owner, obj.object_name, obj.object_type,
    count(buf.block#) as cached_blocks
FROM v$bh buf
INNER JOIN dba_objects obj
    ON buf.objd = obj.data_object_id
WHERE buf.class# = 1 -- data blocks
AND buf.status != 'free'
AND obj.owner = 'EXPCHINOOK'
AND obj.object_name = 'GENRE'
AND obj.object_type = 'TABLE'
GROUP BY obj.owner, obj.object_name, obj.object_type;

SPOOL off;
