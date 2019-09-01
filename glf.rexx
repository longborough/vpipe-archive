/* Get logfiles and date records */
'CallPipe (Name Glf0 Escape \)',
  '  *.Input:',
  '| Spec /Callpipe (Name Glf1) < / 1 1-* Next',
         '/\| Unpack/ Next',
         '/\| Spec !/ Next W1 Next / ! 1 1-* Next/ Next',
         '/\| *.Output:/ Next',
  '| PipCmd',
  '| *.Output:'
Exit Rc
