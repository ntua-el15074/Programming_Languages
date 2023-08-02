fun read () =
  case TextIO.inputLine TextIO.stdIn of
       SOME s => print s
     | NONE => print "NONE\n"
