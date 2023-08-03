fun halve [] = ([], [])
| halve [x] = ([x], [])
| halve (x1::x2::xs) = 
  let 
    val (left, right) = halve xs
  in
    (x1::left, x2::right)
  end

fun split l = 
  let
    val n = length l
    fun splitAt k [] = ([], [])
      | splitAt 0 lst = ([], lst)
      | splitAt k (head::tail) = 
        let
          val (left, right) = splitAt (k-1) tail
        in
          (head::left, right)
        end
  in
    splitAt ((n+1) div 2) l
  end

fun assert s cond = if cond then () else print("wrong test")

fun test () = (
 assert "h0" (halve [] = ([], []));
 assert "h1" (halve [42] = ([42], []));
 assert "h2" (halve [17, 42] = ([17],[42]));
 assert "h3" (halve [11, 17, 42] = ([11, 42],[17]));
 assert "h4" (halve [11, 17, 42, 56] = ([11, 42],[17, 56]));
 assert "s0" (split [] = ([], []));
 assert "s1" (split [42] = ([42], []));
 assert "s2" (split [17, 42] = ([17],[42]));
 assert "s3" (split [11, 17, 42] = ([11, 17],[42]));
 assert "s4" (split [11, 17, 42, 56] = ([11, 42],[17, 56]))
)
