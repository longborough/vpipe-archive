/* Exception log filter */
Trace O
WantStats = 1
NoList = 0
NoZero = 0
Level = 1                /* Default level */
Arg Fn Flag .
If Datatype(Fn,'W') & Fn >= 0 & Fn <= 9 Then
  Arg Level Fn Flag .
If Abbrev("STATS", Flag, 1) Then NoList = 1
If Abbrev("NONZ", Flag, 1) Then NoZero = 1
If Abbrev("LIST", Flag, 1) Then WantStats = 0
WantCount = ( Flag <> t = "" )
If Fn = "" Then Fn = "DEFAULT"
Address Command "STATE" Fn "EXCEPT *"
If Rc <> 0 Then Exit Rc
ThePipe = ,
     '  *.Input:',
     '| NLocate 10.4 /ELI_/',
     '| Spec W3.1 1 1-* 11',
     '| Rexx Cruft',
     '|L: Lookup Count 1-10 Detail',
     '| Spec 11-* 1',
     '| Spec 1-4 1 /-/ next 5-6 next /-/ next 7-9 next 22-* next'
 
If NoList Then
  ThePipe = ThePipe ,
     '| Hole'
 
If NoList < WantStats Then
  ThePipe = ThePipe ,
     '| Literal' Copies('-',79)
 
If WantStats Then
  ThePipe = ThePipe ,
     '| Buffer',
     '|F: Fanin 1 0'
 
ThePipe = ThePipe ,
     '| *.Output:',
     '? <' Fn 'EXCEPT *',
     '| Nfind #' ||,
     '| Strip Trailing',
     '| Locate 1.1',
     '|X: If NLocate 2.1 / /',
     '| Spec /9/ 1 1-* 3',
     '|X:',
     '| Sort D',
     '|T: If Drop 1',
     '| Pick W1.1 >>= /'Level'/',
     '|T:',
     '| Spec W2.1 1 / / 11 1-2 12 W3-* 14',
     '|L:'
 
If WantStats Then Do
  ThePipe = ThePipe ,
     '?L:',
     '| Spec 11.10 1 5-10 12 21-* 22'
  If NoZero Then
    ThePipe = ThePipe ,
       '| NLocate 16.2 / 0/'
  ThePipe = ThePipe ,
     '| Sort 24-*',
     '|F:'
  End
'CALLPIPE (NAME Except ENDCHAR ?)' ThePipe
Exit Rc
