fun addto(l,v) = 
if null l then nil
else hd l + v :: addto(tl l, v);

fun map (f,l) =
if null l then nil
else f (hd l) :: map (f, tl l);

fun map2 (_,[]) = []
  | map2 (f, h::t) = f h :: map2(f,t);

fun addtov x = x + 4;

fun sum nil = 0 | sum(h::t) = h + sum t;

fun halve nil = (nil,nil)
  | halve [a] = ([a],nil)
  | halve (a::b::cs) = 
      let
        val (x,y) = halve cs
      in
        (a::x, b::y)
      end;

val l = [1,2,3,4];

halve (map2(addtov, l));
