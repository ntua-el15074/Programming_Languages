fun powerset [] = [[]]
  | powerset (h::t) =
  let 
    val powerset_t = powerset t
  in
    map (fn x => h :: x) (powerset_t) @ powerset_t   
  end

fun powerset2 [] = [[]]
  | powerset2 (h::t) = 
      foldl (fn (x,acc) => x :: (h :: x) :: acc) [] (powerset2 t)
