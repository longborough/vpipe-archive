/* Filter out log cruft */
Trace O
ThePipe = ,
     '  *.Input:',
     '| NLocate /CDB CAPTURE IS ACTIVE/',
     '| NLocate /BYTES RECEIVED, CONTINUING/',
     '| NLocate /NODE MA04CTC  INACTIVE/',
     '| *.Output:'
'CALLPIPE (NAME Cruft EndChar ?)' ThePipe
Exit Rc
