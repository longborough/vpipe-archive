/* ZUVSM filter */
ThePipe = ,
     '  *.Input:',
     '| Zone 31-53 Inside / ---- SECURITY MODULE -/ / END OF DISPLAY/',
     '| Locate 31.1 / /',
     '| NLocate 32-41 /SDA STATUS/',
     '| Sort 32-34',
     '|N0: Locate 35-38 / ON /',
     '| Unique 32-* Mult',
     '|F0: Faninany',
     '|S1: Unique 32-* Last',
     '| Spec 1-* 1 Write 1-34 1 /----------------------------/ 36',
     '|F1: Faninany',
     '| Sort 32-34',
     '|S2: Unique 32-34 Last',
     '| Spec 36-* 36',
     '|F2: Faninany',
     '| *.Output:',
     '?S1:',
     '|F1:',
     '?S2:',
     '|F2:',
     '?N0:',
     '| Spec 1-* 1 /<</ Nextw',
     '|S3: Unique 32-* First',
     '|F1:',
     '?S3:',
     '| Unique 32-* Last',
     '| Spec 1-* 1 Write 1-34 1 /----------------------------/ 36',
     '|F1:'
'CALLPIPE (NAME Zuvsm ENDCHAR ?)' ThePipe
/*
 
*/
Exit Rc
