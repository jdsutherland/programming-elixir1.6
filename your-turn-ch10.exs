defmodule Collections do
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

  # TODO
  def split([], _), do: {[], []}
end
