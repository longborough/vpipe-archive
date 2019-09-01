/* VPIPECAN REXX A1                     Version: 2.01 */
/* Created on 17 Nov 1986 at 19:41:53                 */
/*         by VPIPEBLD from VPIPECAN VPIPE            */
/*                                                    */
/* Change history:                                    */
/*                                                    */
/* 1987-02-21 2.00 Support for Rexx expressions       */
/* 1987-05-12 2.00 Use To() in place of ToStr()       */
/* 1990-05-15 2.01 Remove null records                */
/* 1990-07-11 2.02 Avoid use of : assignment operator */
/* 1991-04-29 2.03 Adjust for new STRIP behaviour     */
/*                 (My thanks to John Hartmann)       */
/*                                                    */
Parse Arg Vargs
Pipe = 'Rexx VPipeInc|'
Pipe = Pipe'NFind /*|'
Pipe = Pipe'C: If Locate "/*"|'
Pipe = Pipe'Reverse|'
Pipe = Pipe'Not Chop After Str "*/"|'
Pipe = Pipe'Reverse|'
Pipe = Pipe'C:|'
Pipe = Pipe'Strip Trailing|'
Pipe = Pipe'Strip Trailing Str /||/ 1|'
Pipe = Pipe'Pad 1|'
Pipe = Pipe'Append Literal  |'
Pipe = Pipe'Locate 1.1|'
Pipe = Pipe'Change /%/%0/|'
Pipe = Pipe'L: If Locate 1.1 / /|'
Pipe = Pipe'Strip Leading|'
Pipe = Pipe'Spec / / 1 1-* 2|'
Pipe = Pipe'L:|'
Pipe = Pipe'Spec /%1/ 1 1-* 3|'
Pipe = Pipe'L:|'
Pipe = Pipe'B: If Nlocate 2.1|'
Pipe = Pipe'Spec / / 1 1-* 11|'
Pipe = Pipe'B:|'
Pipe = Pipe'Spec Number 1 1-* 11|'
Pipe = Pipe'B:|'
Pipe = Pipe'Unique|'
Pipe = Pipe'Spec 11-* 1|'
Pipe = Pipe'Join * /%1/|'
Pipe = Pipe'Change /%1 %1/%2/|'
Pipe = Pipe'Change /%1 / /|'
Pipe = Pipe'Change /%2/%1 %1/|'
Pipe = Pipe'Split At Str /%1/|'
Pipe = Pipe'Change /%0/%/|'
Pipe = Pipe'Rexx VpipEval' Vargs'|'
Pipe = Pipe'Escape /\\||บบ/|'
Pipe = Pipe'S: If Locate 1.1 / /|'
Pipe = Pipe'Insert /บบ/|'
Pipe = Pipe'S:|'
Pipe = Pipe'Insert /||/|'
Pipe = Pipe'S:|'
Pipe = Pipe'Join *|'
Pipe = Pipe'Change /บบ ||/บบ/|'
Pipe = Pipe'Spec 2-* 1'
'CALLPIPE (End บ StageSep |) *.Input.0:|'Pipe'|*.Output.0:'
Exit Rc
