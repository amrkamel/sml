
fun countup(from: int, to: int) =
    if from = to
    then to :: []
    else from :: countup(from + 1, to)

fun max(xs: int list) =
    if null xs
    then 0
    else if hd xs > max(tl xs)
    then hd xs
    else max(tl xs)

fun exist(xs: int list, token: int) =
    if null xs
    then false
    else if hd xs = token
    then true
    else exist(tl xs, token)

fun remove_from_list(xs: int list, token: int) =
    if null xs
    then []
    else if token = hd xs
    then remove_from_list(tl xs, token)
    else hd xs :: remove_from_list(tl xs, token)

fun remove_first(xs: int list, token: int) =
    if hd xs = token
    then tl xs
    else hd xs :: remove_first(tl xs, token)

fun exist_more_than_once(xs: int list, token: int) =
    if null xs
    then false
    else if exist(xs, token) 
    then if exist(remove_first(tl xs, token), token)
    then true
    else false
    else false

fun exist_more_than_once2(xs: int list, token: int) =
    if null xs
    then false
    else if hd xs = token
    then exist(tl xs, token)
    else exist_more_than_once2(tl xs, token)

fun distinct(xs: int list) =
  if null xs
  then []
  else hd xs :: distinct(remove_from_list(xs, hd xs))

(*fun max_list(xs: int list) =
  if null xs
  then ~9
  else 
  let 
    val maxed = max_list(tl xs)
    val head = hd xs
  in 
    if head > maxed
    then head
    else maxed
  end *)
