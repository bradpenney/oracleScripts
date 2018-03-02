#!/bin/bash

# Connect to RMAN
rman target / catalog recoveryman/recoveryman@bkuprec << EOF

# These commands run inside RMAN
# Turn on spooling log
spool log to /bkuprecScripts/auditLogs/RMANBackupCumulativeLevel1.log append;

# Backup of all database blocks modified since last full backup (Incremental Level 0)
backup incremental level 1 cumulative database;

# Stop spooling and exit RMAN
spool log off;
exit;

EOF
