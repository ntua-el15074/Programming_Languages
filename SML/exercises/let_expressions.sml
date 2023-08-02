fun function (z::int) = 
  let 
    val x = if z > 0 then z else 0;
  in
    x + 2
  end

fun reverse l = 
  let
    fun reverse (nil,z) = z
      (* | reverse nil = nil *)
      | reverse (y::ys,z) = reverse (ys,y::z) 
  in
    reverse (l,nil)
  end

fun add_lists (l,r) = 
  let 
    fun add_lists (nil,nil) = nil
      | add_lists (h1::t1,h2::t2) = (h1 + h2)::add_lists(t1,t2);
  in
    add_lists (l,r)
  end

val l = [1,2,3,4,5];

val rev_l = reverse l;

val added_lists = add_lists(l,rev_l);

(* (1::[2,3,4], 5) *)
(* 1 2 3 4 5 => 5 4 3 2 1 *)


