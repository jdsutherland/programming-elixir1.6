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

  defp next(actual, mid, _, _) when actual == mid, do: actual
  defp next(actual, mid, lo, _) when actual < mid, do: guess(actual, lo..mid)
  defp next(actual, mid, _, hi) when actual > mid, do: guess(actual, mid..hi)
end

# – Convert a float to a string with two decimal digits. (Erlang)
:erlang.float_to_binary(2.22, [decimals: 2])
# – Get the value of an operating-system environment variable. (Elixir)
System.get_env
# – Return the extension component of a file name (so return .exs if given "dave/test.exs"). (Elixir)
Path.extname("foo.exs")
# – Return the process’s current working directory. (Elixir)
System.cwd
# – Convert a string containing JSON into Elixir data structures. (Just find; don’t install.)
https://github.com/michalmuskala/jason
# – Execute a command in your operating system’s shell.
System.cmd
