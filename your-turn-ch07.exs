defmodule MyList do
  def mapsum([], _), do: 0
  def mapsum([head | tail], func), do: func.(head) + mapsum(tail, func)

  def max([]), do: nil
  def max([head | tail]), do: _max(tail, head)
  defp _max([], winning), do: winning
  defp _max([head | tail], winning) when head > winning, do: _max(tail, head)
  defp _max([_ | tail], winning), do: _max(tail, winning)

  def caesar([], _), do: []
  def caesar([head | tail], n) when head+n <= ?z do
    [head+n | caesar(tail, n)]
  end
  def caesar([head | tail], n) do
    [head+n-(?z-?a+1) | caesar(tail, n)]
  end

  def span(from, to) when from > to, do: []
  def span(from, to), do: [from | span(from+1, to)]

  def span_tc(from, to), do: _span_tc(from, to, [])
  defp _span_tc(from, to, list) when from > to, do: list
  defp _span_tc(from, to, list), do: _span_tc(from, to - 1, [to | list])
end
