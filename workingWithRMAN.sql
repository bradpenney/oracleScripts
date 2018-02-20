/*
Author: Brad Penney 
Data: February 19th, 2018
Purpose: Working with RMAN
Based on: https://dbatricksworld.com/how-to-configure-oracle-rman-backup-for-the-first-time/
*/

-- RUN AS "SYS as SYSDBA"
-- Uncomment each statment individually in order

-- Shows where the recoery files are located
-- SHOW PARAMETER db_recovery_file_dest;

-- Check to see if ArchiveLog is On
-- SELECT log_mode FROM V$DATABASE;

/*
If archive logging is not active, complete the following:
1) Shutdown database
2) Restart with "startup mount"
3) Run "ALTER DATABASE ARCHIVELOG;"
4) Run "ALTER DATABASE OPEN"
*/

-- Check to see if read_write is enabled
-- SELECT open_mode FROM V$DATABASE;

-- Ensure that ArchiveLog has a destination
-- ARCHIVE LOG LIST;

-- Change the location of the archive log destination (if desired)
-- Note: Bouncing (restarting the database) will be required to take effect
-- ALTER SYSTEM SET log_archive_dest_1='location=/u02/archive_log/archive_log' scope=spfile;
    
-- Ensure the flash / fast recovery area location
-- SHOW PARAMETER db_recovery_file_dest

/*
Commands to configure RMAN in terminal:
1) rman target /
2) RMAN> configure controlfile autobackup on;
3) RMAN> configure backup optimization on;
4) RMAN> CONFIGURE RETENTION POLICY TO RECOVERY WINDOW OF 7 DAYS;
*/

-- Check global name to ensure connected to correct db
-- SELECT global_name FROM global_name;

-- Create tablespace to store recovery data
-- CREATE TABLESPACE RMAN_backup 
  -- DATAFILE '/u02/RMAN_recovery/catalog_recovery.dbf'
  -- SIZE 100M AUTOEXTEND ON MAXSIZE UNLIMITED;
  
-- Create user recoveryman
-- CREATE USER recoveryman IDENTIFIED BY recoveryman;

-- Alter user to assign default tablespace
-- ALTER USER recoveryman DEFAULT TABLESPACE RMAN_backup TEMPORARY TABLESPACE temp;

-- Grant recovery catalog ownership to recoveryman
-- GRANT recovery_catalog_owner TO recoveryman;

-- Grant connect and resource privileges to recoveryman
-- GRANT connect, resource TO recoveryman;

/*
Switch to terminal
1) Log onto RMAN via terminal using 
   rman target / catalog recoveryman/recoveryman@bkuprec
2) RMAN> create catalog;
3) Exit RMAN & open SQLPLUS
4) Logon as "recoveryman" using password assigned above
5) SQL> show user;
6) Exit SQLPLUS & open RMAN
7) RMAN> register database;
8) RMAN> report schema; -- shows databases registered by RMAN
*/


