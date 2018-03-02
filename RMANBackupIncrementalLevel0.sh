#!/bin/bash

# Connect to RMAN
rman target / catalog recoveryman/recoveryman@bkuprec << EOF

# These commands run inside RMAN
# Turn on spool logging
spool log to /bkuprecScripts/auditLogs/RMANIncrementralBackupLevel0.log append;

# Full backup of database
backup incremental level 0 database;

# Turn of spooling and exit RMAN
spool log off;
exit;

EOF
