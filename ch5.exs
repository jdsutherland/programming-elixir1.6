greeter = fn name -> (fn -> "Hello #{name}" end) end

add_n = fn n -> (fn other -> n + other end) end

apply = fn (fun, value) -> fun.(value) end

list = [1, 3, 5, 7, 9]
Enum.map list, fn elem -> elem * 2 end

add_one = &(&1 + 1) # same as add_one = fn (n) -> n + 1 end
add_one = &(&1 + 1) # same as add_one = fn (n) -> n + 1 end
add_one.(44)
square = &(&1 * &1)
square.(8)
speak = &(IO.puts(&1))
speak.("Hello")
rnd = &(Float.round(&1, &2))
rnd = &(Float.round(&2, &1))
divrem = &{ div(&1,&2), rem(&1,&2) }
divrem.(13, 5)
s = &"bacon and #{&1}"
s.("custard")
match_end = &~r/.*#{&1}$/
"cat" =~ match_end.("t")
"cat" =~ match_end.("!")
