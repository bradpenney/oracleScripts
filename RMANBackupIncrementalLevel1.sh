#!/bin/bash

# Connect to RMAN
rman target / catalog recoveryman/recoveryman@bkuprec << EOF

# These commands run inside RMAN
# Turn on spooling log
spool log to /bkuprecScripts/auditLogs/RMANIncrementralBackupLevel1.log append;

# Take backup of all database blocks modified since last incremental backup
backup incremental level 1 database;

# Stop spooling and exit RMAN
spool log off;
exit;

EOF
