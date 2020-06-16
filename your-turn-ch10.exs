defmodule MyList do
  def all?([], _), do: true
  def all?([head | tail], pred), do: pred.(head) && all?(tail, pred)

  def each([], _), do: :ok
  def each([head | tail], fun), do: fun.(head) && each(tail, fun)

  def filter([], _), do: []
  def filter([head | tail], pred) do
    if pred.(head) do
      [head | filter(tail, pred)]
    else
      filter(tail, pred)
    end
  end

  def split([], _), do: {[], []}
  def split(list, count) when count <= 0, do: {[], list}
  def split([head | tail], count) do
    {first, second} = split(tail, count - 1)
    {[head | first], second}
  end

  def take(list, amount) when list == [] or amount == 0 , do: []
  def take([head | tail], amount) do
    [head | take(tail, amount - 1)]
  end

  def flatten([]), do: []
  def flatten([head | tail]) do
    flatten(head) ++ flatten(tail)
  end
  def flatten(head), do: [head]
end
