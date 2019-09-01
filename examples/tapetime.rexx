/* Filter ZUTAP output to specific timeframe */
/* TapeTime hhmm(Start) hhmm(End)            */
Arg Tstart Tfinis .
If Tstart = "" Then Tstart = "0000"
If Tfinis = "" Then Tfinis = "2359"
If Tstart > Tfinis Then
  Parse Value Tstart Tfinis With Tfinis Tstart
Trace O
ThePipe = ,
     '  *.Input:',
     '| Pick 36.4 >>= /' || Tstart || '/',
     '| Pick 31.4 <<= /' || Tfinis || '/',
     '| *.Output:'
'CALLPIPE (NAME TapeTime EndChar ?)' ThePipe
Exit Rc
