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

fun smallest l =
  let
    val sorted_l = ListMergeSort.sort (op>) l
    fun get_first_gap n [] = n
      | get_first_gap n (h::t) = if n = h then get_first_gap (n+1) t else n
    in
      get_first_gap 0 sorted_l
    end

fun smallest2 l = 
  let 
    val n = length l
    val a = Array.array (n,false)
    fun fill [] = ()
      | fill (h::t) = (
        if h < n then Array.update (a, h, true) else ();
        fill t
      )
    fun get_first_gap i = 
      if i >= n orelse not (Array.sub (a, i)) then i else get_first_gap (i+1)
 in
   fill l;
   get_first_gap 0 
 end


local
  structure S = BinarySetFn(struct
    type ord_key = int
    val compare = Int.compare
  end)
in
  fun smallest3 l = 
    let
      val s = S.addList (S.empty, l)
      fun get_first_gap i = 
        if not (S.member (s, i)) then i else get_first_gap (i+1)
    in
      get_first_gap 0 
    end
end







