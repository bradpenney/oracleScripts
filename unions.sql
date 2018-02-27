/*
Author: Brad Penney
Purpose: Playing with Unions
*/

SPOOL /bkuprecScripts/auditLogs/unions.log append;

-- CREATE UNION BETWEEN TWO TABLES - show how records fit together between two tables
-- SELECT invoiceid FROM INVOICELINE UNION SELECT invoiceid FROM INVOICE;

-- CREATE UNION ALL BETWEEN TWO TABLES - adds records together
-- SELECT invoiceid FROM INVOICELINE UNION ALL SELECT invoiceid FROM INVOICE;

-- CREATE MINUS BETWEEN TWO TABLES - shows records not correlated to other table
SELECT invoiceid FROM INVOICELINE MINUS SELECT invoiceid FROM INVOICE;
SPOOL off;
