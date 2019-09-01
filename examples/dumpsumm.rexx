/* Find dumps from log stream */
Trace O
ThePipe = ,
     '  *.Input:',
     '| Locate 10.4 /DWA_/',
     '| Ls -2 CPSE0',
     '| Spec / / 1 86.11 2 Read 39.7 Next Read',
     '| Sort Count',
     '| *.Output:'
'CALLPIPE (NAME Dumps ENDCHAR ?)' ThePipe
Exit Rc
/*
*/
