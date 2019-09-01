/* Generic log search filter */
/* LS <n> search */
Trace O
Arg Parms
Parse Var Parms Nl Rest
WantSep = 0
If Datatype(Nl,'W') & Rest <> "" Then Do
  Parms = Rest
  WantSep = (Nl < -1)
  Nl = Abs(Nl)
  End
Else
  Nl = 1
If Parms = "" Then Exit 99
Sep = ""
If Nl > 1 Then Do
  TheFind = 'Between /1/' Min(Nl,100) + WantSep
  If WantSep Then
    Sep = '/1------------------------/ 1 Write'
  End
Else
  TheFind = 'Find 1'
Parms = Strip(Parms)
Pad = Copies("! ",Nl+2)
If Substr(Parms,1,1) <> "!" Then
  Parms = "!"Parms"!"
ThePipe = ,
     '  *.Input:',
     '|L: If CaseI Locate' Parms,
     '| Spec /'Pad'/ 1 Write' Sep '/1/ 1 1-* 2',
     '| Split /!/',
     '|L:',
     '| Spec /0/ 1 1-* 2',
     '|L:',
     '|' TheFind ||,
     '| Spec 2-* 1',
     '| Nfind _' ||,
     '| Drop' WantSep,
     '| *.Output:'
'CALLPIPE (NAME LSearch EndChar ?)' ThePipe
Exit Rc
