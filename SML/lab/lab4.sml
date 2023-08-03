local
  val tests = [
    ("test1", [], 0),
    ("test2", [0], 1),
    ("test3", [1], 0),
    ("test4", [0,1,2,3], 4),
    ("test5", [3,2,1,0], 4),
    ("test6", [0,2,3], 1)
  ]

  fun runtests f [] = ()
    | runtests f ((msg, input, output) :: testcases) = (
        print ("Testcase " ^ msg ^ ": ");
        if f input = output then print "Ok!\n"
        else print "Failed!\n";
        runtests f testcases
    )
in
  fun test f = runtests f tests
end
