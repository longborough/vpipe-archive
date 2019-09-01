/* VPIPEVAL REXX A1               VPIPE Version: 2.00 */;
/* Created on 18 Feb 1986 at 15:02:53                 */;
/*                                                    */;
/* Change history:                                    */;
/*                                                    */;
/* 1987-02-21 2.00 Created                            */;
/*                                                    */;
/* Filter to evaluate a Rexx expression as part of a VPIPE            */;
Signal On Syntax;
Restart:;
Do Forever;
   'Readto $In'                     /* Get next input record           */;
   If Rc <> 0;
   Then                             /* If EOF or nasty,                */;
   Return Rc * (Rc <> 12)           /* finish                          */;
   If Verify($In,"'"||'"','MATCH') /= 1;
   Then;
   'Output' $In                     /* No expression, straight out     */;
   Else Do;
      S.  = '';
      Interpret 'S.1 =' || $In      /* Evaluate the expression         */;
      Do $I = 1 By 1 While S.$I /== ""  /* And output all the stages   */;
         'Output' S.$I              /* One by One                      */;
         End;
      End;
   End;
Syntax:;
Say 'Syntax Error' Rc
Say Errortext(Rc)
Say $In;
'Output Syntax Error' Rc
Signal Restart;
