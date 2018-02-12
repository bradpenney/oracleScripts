/*
Author: Brad Penney
Purpose: Add a Redo Log Group
*/

ALTER DATABASE add logfile GROUP 2
('/u02/redo/redo02a.rdo', '/u02/redo/redo02b.rdo') SIZE 50M;

