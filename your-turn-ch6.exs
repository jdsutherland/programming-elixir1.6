defmodule Times do
  def double(n) do
    n * 2
  end

  def triple(n) do
    n * 3
  end

  def quadruple(n) do
    double(n) + double(n)
  end
end

defmodule Recursion do
  def sum(0), do: 0
  def sum(n), do: n + sum(n-1)

  def gcd(x, 0) when x >= 0, do: x
  def gcd(x, y) when x >= 0 and y >= 0, do: gcd(y, rem(x, y))
end

defmodule Chop do
  def guess(actual, range) do
    lo..hi = range
    mid = div(lo + hi, 2)
    IO.puts "Is it #{mid}"
    next(actual, mid, lo, hi)
  end

  def next(actual, mid, _, _) when actual == mid, do: actual
  def next(actual, mid, lo, _) when actual < mid, do: guess(actual, lo..mid)
  def next(actual, mid, _, hi) when actual > mid, do: guess(actual, mid..hi)
end
