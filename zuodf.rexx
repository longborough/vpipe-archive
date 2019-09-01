/* Dumps log filter */
Arg All .
If Abbrev('ALL', All, 1) Then
  Weed = ""
Else
  Weed = "| NLocate / NODUMP /"
ThePipe = ,
     '  *.Input:',
     '| Zone 31-41 Inside  / UODF0000I / / End of ODF/',
     '| Zone 39-42 All /CTL-/ ! /OPR-/ ! /SNP-/',
      Weed ,
     '| Sort 32-36 ',
     '| Spec 32-* 1',
     '| Unique 1-* Last',
     '| Sort 12-25 7.1',
     '| *.Output:'
'CALLPIPE (NAME Dumps ENDCHAR ?)' ThePipe
Exit Rc
