/*
Author: Brad Penney
Purpose: Playing with Indexes
*/

SPOOL /bkuprecScripts/auditLogs/index.log append;

-- Creates an index on invoiceline
CREATE INDEX idx_invoiceline ON invoiceline (invoiceid, quantity, trackid)
	TABLESPACE CHINOOK_IDX;

-- Also needs to be put into a tablespace
SPOOL off;
