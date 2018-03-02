#!/bin/bash

# Connect to RMAN
rman target / catalog recoveryman/recoveryman@bkuprec << EOF

# These commands run inside RMAN
# Turn on spooling (create log file)
spool log to /bkuprecScripts/auditLogs/RMANFullBackupWithLogs.log append;

# Full backup of database and Redo Logs
backup database plus archivelog;

# Turn off spooling and exit RMAN
spool log off;
exit;

EOF
