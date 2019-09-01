/* Generic log stream browse */
/* LB <fileid> */
Trace O
Arg Fileid
If Fileid = "" Then Fileid = "LB TEMP A1"
'CALLPIPE (NAME LBrowse ENDCHAR ?)',
     '  *.Input:',
     '| >' Fileid,
     '| COUNT LINES',
     '| VAR LINES',
     '| NFIND 0' ||,
     '| Spec /KBROWSE' Fileid '/ 1',
     '| CMS'
If Rc = 0 | Rc = 12 Then Do
  If Lines < 1 Then Do
    Address Xedit 'COMMAND LOCATE +0'
    If Rc < 0 Then
      Say 'No records found'
    Else
      Address Xedit 'COMMAND EMSG Sorry, nothing found'
    End
  End
Else Say 'Deu crepe' Rc
