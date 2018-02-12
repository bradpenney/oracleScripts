/*
Author: Brad Penney
Purpose: Drop Logfile Group
*/

-- Drop the redo log file
ALTER DATABASE DROP LOGFILE GROUP 2;

-- If redo log is active, run this
--ALTER SYSTEM SWITCH LOGFILE;
--ALTER SYSTEM CHECKPOINT;