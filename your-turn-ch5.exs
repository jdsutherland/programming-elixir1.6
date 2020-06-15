list_concat = fn l1, l2 -> l1 ++ l2 end
sum = fn a, b, c -> a + b + c end
pair_tuple_to_list = fn tup -> Tuple.to_list(tup) end
pair_tuple_to_list.( { 1234, 5678 } )

fizzbuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, c -> c
end

rembuzz = fn n -> fizzbuzz.(rem(n, 3), rem(n, 5), n) end

prefix = fn s1 -> (fn s2 -> "#{s1} #{s2}" end) end

# Enum.map [1,2,3,4], fn x -> x + 2 end
Enum.map [1,2,3,4], &(&1 + 2)
# Enum.each [1,2,3,4], fn x -> IO.inspect x end
Enum.each [1,2,3,4], &(IO.inspect &1)
