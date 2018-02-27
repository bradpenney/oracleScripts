/* 
Author: Brad Penney, February 2018
Purpose: Partition a Table
*/

SPOOL /bkuprecScripts/auditLogs/partitionTable.log append;
SET ECHO ON
SHOW USER
SELECT SYSDATE FROM dual;
SELECT NAME FROM v$database;

-- View table to be partitioned
-- DESCRIBE expchinook.invoice;
-- SELECT * FROM expchinook.invoice;

CREATE TABLE expchinook.invoice_part (
invoiceid NUMBER NOT NULL,
customerid NUMBER NOT NULL,
invoicedate DATE NOT NULL,
billingaddress VARCHAR2(70), 
billingcity VARCHAR2(40),
billingstate VARCHAR2(40),
billingcountry VARCHAR2(40),
billingpostalcode VARCHAR2(10),
total NUMBER(10,2) NOT NULL)
PARTITION BY RANGE (invoicedate)
(PARTITION invoicedate2009 VALUES LESS THAN (TO_DATE('31-DEC-2009','DD-MON-YYYY')),
PARTITION invoicedate2010 VALUES LESS THAN (TO_DATE('31-DEC-2010','DD-MON-YYYY')),
PARTITION invoicedate2011 VALUES LESS THAN (TO_DATE('31-DEC-2011','DD-MON-YYYY')),
PARTITION invoicedate2012 VALUES LESS THAN (TO_DATE('31-DEC-2012','DD-MON-YYYY')),
PARTITION invoicedate2013 VALUES LESS THAN (TO_DATE('31-DEC-2013','DD-MON-YYYY')));

SPOOL off;
