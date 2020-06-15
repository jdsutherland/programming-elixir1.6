list_concat = fn l1, l2 -> l1 ++ l2 end
sum = fn a, b, c -> a + b + c end
pair_tuple_to_list = fn tup -> Tuple.to_list(tup) end
pair_tuple_to_list.( { 1234, 5678 } )
