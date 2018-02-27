/* 
Author: Brad Penney, February 2018
Purpose: Creating Environment
*/


SET ECHO ON
SHOW USER
SELECT SYSDATE FROM dual;
SELECT NAME FROM v$database;

-- UNCOMMENT AS NECESSARY

-- Create tablespace for STAGING
--CREATE TABLESPACE STAGING
--DATAFILE '/u02/bkuprec/STAGING_01.dbf' SIZE 100M,
--         '/u02/bkuprec/STAGING_02.dbf' SIZE 100M;

-- Create user for STAGING AREA
--CREATE USER load_staging 
--    IDENTIFIED BY student
--    DEFAULT TABLESPACE STAGING
--    QUOTA 200M ON users;

-- Grant privileges to load_staging
-- GRANT CONNECT, resource, create session, create table, create view TO load_staging;

