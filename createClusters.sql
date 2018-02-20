/*
Author: Brad Penney
Purpose: Create Cluster

*/

SPOOL /bkuprecScripts/auditLogs/createCluster.log append;
SET ECHO ON;
SHOW USER;
SELECT SYSDATE FROM dual;
SELECT NAME FROM v$database;

-- Create a Cluster
-- CREATE CLUSTER expchinook.sc_srvr_id (srvr_id NUMBER(10)) SIZE 1024;

-- Check to see if the cluster is created
-- SELECT cluster_name, tablespace_name, hashkeys, degree, single_table FROM dba_clusters;

-- Create sample table to add cluster to
CREATE TABLE expchinook.cservers(
srvr_id    NUMBER(10),
network_id NUMBER(10),
status     VARCHAR2(1),
latitude   FLOAT(20),
longitude  FLOAT(20),
netaddress VARCHAR2(15))
CLUSTER expchinook.sc_srvr_id (srvr_id);

SPOOL off;