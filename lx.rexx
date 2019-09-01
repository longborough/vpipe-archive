/* Strip Timestamp from log stream */
Trace O
ThePipe = ,
     '  *.Input:',
     '| Spec 31-* 1',
     '| *.Output:'
'CALLPIPE (NAME LX ENDCHAR ?)' ThePipe
Exit Rc
