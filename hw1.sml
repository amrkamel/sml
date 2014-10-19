

fun is_older(date1: int * int * int , date2: int * int * int) =
    let 
	val date1_year = #1 date1
	val date1_month = #2 date1
	val date1_day = #3 date1
	val date2_year = #1 date2
	val date2_month = #2 date2
	val date2_day = #3 date2
    in
	if date1_year < date2_year
	then true
	else if date1_year > date2_year
	then false
	else if date1_month < date2_month
	then true
	else if date1_month > date2_month
	then false
	else if date1_day < date2_day
	then true
	else false
    end 


fun number_in_month(dates_list: (int * int * int) list, month: int) =  
    if null dates_list
    then 0
    else
	let
	    val tail = tl dates_list
	in
	    if #2(hd dates_list) = month
	    then 1 + number_in_month(tail, month)
	    else number_in_month(tail, month) 
	end


fun number_in_months(dates_list: (int * int * int) list, months_list: int list) =
    if null months_list
    then 0
    else number_in_month(dates_list, hd months_list) + number_in_months(dates_list, tl months_list)
								       
fun dates_in_month(dates_list: (int * int * int) list, month: int) =
    if null dates_list
    then []
    else
	let 
	    val rest_of_dates = dates_in_month(tl dates_list, month)
	in
	    if #2(hd dates_list) = month
	    then hd dates_list :: rest_of_dates
	    else rest_of_dates
	end

fun dates_in_months(dates_list: (int * int * int) list, months_list: int list) =
    if null months_list
    then []
    else dates_in_month(dates_list, hd months_list) @ dates_in_months(dates_list, tl months_list)

fun get_nth(list: string list,n: int) =
    if n = 1
    then hd list
    else get_nth(tl list, n - 1)

fun date_to_string(date: (int * int * int)) =
    let
	val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    in
	get_nth(months, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
    end
      
fun number_before_reaching_sum(sum: int, list: int list) =
    if sum <= hd list
    then 0
    else 1 + number_before_reaching_sum(sum, hd list + hd(tl list) :: tl(tl list))

fun what_month(day: int) =
    let
	val months_capacity = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
	1 + number_before_reaching_sum(day, months_capacity)
    end

fun month_range(day1: int, day2: int) =
    if day1 > day2
    then []
    else what_month(day1) :: month_range(day1 + 1, day2)

fun oldest(list: (int * int * int) list) =
    0

fun number_in_months_challenge(dates_list: (int * int * int) list, months_list: int list) =
    let
	fun distinct(l: int list) =
	    
    in
    end
      
fun dates_in_months_challenge(dates_list: (int * int * int) list, months_list: int list) =
    0

fun reasonable_date(date: (int * int *int)) =
    let
	fun get_n(list: int list,n: int) =
	    if n = 1
	    then hd list
	    else get_n(tl list, n - 1)

	fun valid_year(year: int) = 
	    if year > 0
	    then true
	    else false
		     
	fun valid_month(month: int) =
	    if month > 0 andalso month < 13
	    then true 
	    else false		     

	fun or(b1: bool, b2: bool) =
	    if(b1 = b2)
	    then b1
	    else not(b1 andalso b2)

	fun leap_year(year: int) =
	    if or(year mod 400 = 0,year mod 4 = 0 andalso not(year mod 100 = 0))
	    then true
	    else false

	fun valid_day(day: int, month: int, year: int) =
	    if day <= get_n([31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31], month)
	    then true
	    else if leap_year(year) andalso day = 29
	    then true
	    else false
    in
	valid_year(#1 date) andalso valid_month(#2 date) andalso valid_day(#3 date, #2 date, #1 date)
    end
