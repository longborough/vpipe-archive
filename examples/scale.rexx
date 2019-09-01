/* Inject a scale */
Trace O
Arg Length Start .
If ^Datatype(Length,'W') Then Length = 80
If ^Datatype(Start,'W') Then Start = 1
X = Copies('|----+----',1+Length % 10)
S = 1 + Start // 10
Scale = Substr(X,S,Length)
'CallPipe (Name Scale) Var SCALE|*.output:'
'Short'
'Commit 0'
Exit Rc
