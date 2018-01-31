#!/bin/bash

#Author: Brad Penney - January 2018
# Purpose: Backs up listner.ora and tnsnames.ora

#Create a copy of the listener.ora file
cp /u01/app/oracle/product/11.2.0/db1/network/admin/listener.ora /u02/listener_tsnames_backup/listener_backup_JAN312018.ora

#Create a copy of the tnsnames.ora file
cp /u01/app/oracle/product/11.2.0/db1/network/admin/tnsnames.ora /u02/listener_tsnames_backup/tnsnames_backup_JAN312018.ora



