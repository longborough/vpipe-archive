/* ZUTAP SUM log filter */
Arg Tape .
Select
  When Tape = "" Then Do
    Filter = ""
    Reorder = ""
    End
  When Datatype(Tape,'W') Then Do       /* Search for Volser */
    If Tape < 100000 Then Tape = Tape + 400000
    Filter = '| Locate 27.6 /'Tape'/'
    Reorder = ""
    End
  Otherwise Do                          /* Search for DSN    */
    Filter = '| Locate 83-* /'Tape'/'
    Reorder = "| Sort 83-* 36.9 52.4"
    End
  End
ThePipe = ,
     '  *.Input:',
     '| SPEC 10-* 1',
     '| ZONE 23-32 INSIDE  /UTHC0165I/ /End of dis/',
     '| ZONE 26.4 ALL / 4/ ! / CAP/ ! / EX/',
     Filter,
     '| SORT 27.6 5.7',
     '| UNIQUE 27.6 LAST',
     Reorder,
     '| SPEC 22-* 1',
     '| *.Output:'
'CALLPIPE (NAME Zutap ENDCHAR ?)' ThePipe
Exit Rc
