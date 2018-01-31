#!/bin/bash

#Author: Brad Penney - January 2018
# Purpose: Imports Chinook schema via datapump

# Imports Chinook schema to CHINOOKEXP directory
impdp expchinook schemas=chinook remap_schema=chinook:EXPCHINOOK directory=chinookIMP dumpfile=chinookSchema.dmp logfile=CHINOOKIMPORT.log




