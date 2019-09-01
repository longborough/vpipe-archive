/* Generic log time filter */
/* LT Start <End> */
Trace O
Arg Start Minutes
Parse Value TConvert(Start,Minutes) With T1 T2 .
If T1 = "" Then Exit 99
ThePipe = ,
     '  *.Input:',
     '| PICK 22.8 >>= /'T1'/',
     '| PICK 22.8 <<= /'T2'/',
     '| *.Output:'
 
'CALLPIPE (NAME LTime ENDCHAR ?)' ThePipe
Exit Rc
 
Tconvert: Procedure
  Parse Arg Stime, Min
If ^Datatype(Min,'W') Then Min = 5
/* If Min > 60 Then Min = 60 */
Select
  When Stime < 24  Then
    Stime = Stime * 10000 + 1000000
  When Stime < 10000 Then
    Stime = Stime * 100 + 1000000
  Otherwise
    Stime = Stime + 1000000
  End
Parse Var Stime . +1 hh +2 mm +2 ss +2 .
Do While ss > 59
  ss = Right(ss - 60,2,0)
  mm = Right(mm + 1,2,0)
  End
Do While mm > 59
  mm = Right(mm - 60,2,0)
  hh = Right(hh + 1,2,0)
  End
he = hh
me = Right(mm + min,2,0)
Do While me > 59
  me = Right(me - 60,2,0)
  he = Right(he + 1,2,0)
  End
Return hh':'mm':'ss he':'me':'ss
