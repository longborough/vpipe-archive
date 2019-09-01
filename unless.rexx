/* Inverse of If Filter */
'Maxstream Input'
Ns = Rc
'Maxstream Output'
Ns = Min(Ns, Rc)
Parse Arg Stage
Trace O
Select
  When Ns = 0 Then
    'AddPipe (End \) *.Input.0:  |X:' Stage ||,
                    '\X:          |*.Output.0:'
  When Ns = 1 Then
    'AddPipe (End \) *.Input.0:  |X:' Stage ||,
                    '|Y: Faninany |*.Output.1:',
                    '\X:          |*.Output.0:',
                    '\*.Input.1:  |Y:'
  Otherwise
    'AddPipe (End \) *.Input.0:  |X:' Stage || '|*.Output.1:',
                    '\X:          |*.Output.0:',
                    '\*.Input.1:  |Y: Faninany   |*.Output.2:',
                    '\*.Input.2:  |Y: '
  End
'Short'
'Commit 0'
Exit Rc
