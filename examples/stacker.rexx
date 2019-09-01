/* Split tape list into 2 stackers */
Arg Date .
Sort = '31.9'
If Date = "" Then Do
  Filter = ""
  Sday = "---------"
  End
Else Do
  If Datatype(Date,'W') Then
    Filter = "| Locate 10.4 /"Date"/"
  Else
    Filter = "| Locate 25.5 /"Date"/"
  Sday = "  "Date"  "
  End
ThePipe = ,
     '  *.Input:',
     '| NLocate 35.5 / SBY /',
     '| NLocate 35.5 / ACT /',
     Filter,
     '| Sort' Sort,
     '|D:Deal',
     '| Sort' Sort 'D',
     '| Literal Stack 1 -'Sday'--------------------------------------',
     '| Buffer',
     '|F: Fanin',
     '| *.Output:',
     '?D:',
     '| Sort' Sort 'D',
     '| Literal Stack 2 -'Sday'--------------------------------------',
     '| Literal  ',
     '| Buffer',
     '|F:'
'CALLPIPE (NAME Stacker ENDCHAR ?)' ThePipe
Exit Rc
