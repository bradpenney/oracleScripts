/*
Author: Brad Penney 
Data: February 9th, 2018
Purpose: Viewing Details about Tablespaces
*/

-- Show description of dba_tablespaces
-- DESCRIBE dba_tablespaces;

-- Show description of data files
-- DESCRIBE DBA_DATA_FILES;

-- Show file names and tablespace name within database
SELECT file_name, tablespace_name FROM DBA_DATA_FILES;

-- Shows all the tablespaces in the database10C
SELECT tablespace_name, status, contents, logging FROM DBA_tablespaces;
