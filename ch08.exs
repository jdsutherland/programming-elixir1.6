map = %{ name: "Dave", likes: "Programming", where: "Dallas" }
Map.keys map
Map.values map
map[:name]
map.name
map1 = Map.drop map, [:where, :likes]
map2 = Map.put map, :also_likes, "Ruby"
Map.keys map2
Map.has_key? map1, :where
{ value, updated_map } = Map.pop map2, :also_likes
Map.equal? map, updated_map

person = %{ name: "Dave", height: 1.88 }
%{ name: a_name } = person
%{ name: _, weight: _ } = person

people = [
  %{ name: "Grumpy",    height: 1.24 },
  %{ name: "Dave",      height: 1.88 },
  %{ name: "Dopey",     height: 1.32 },
  %{ name: "Shaquille", height: 2.16 },
  %{ name: "Sneezy",    height: 1.28 }
]
IO.inspect(for person = %{ height: height } <- people, height > 1.5, do: person)

defmodule HotelRoom do
  def book(%{name: name, height: height})
  when height > 1.9 do
    IO.puts "Need extra-long bed for #{name}"
  end

  def book(%{name: name, height: height})
  when height < 1.3 do
    IO.puts "Need low shower controls for #{name}"
  end

  def book(person) do
    IO.puts "Need regular bed for #{person.name}"
  end
end
people |> Enum.each(&HotelRoom.book/1)

data = %{ name: "Dave", state: "TX", likes: "Elixir" }
for key <- [ :name, :likes ] do
  %{ ^key => value } = data
  value
end

m = %{ a: 1, b: 2, c: 3 }
# %{a: 1, b: 2, c: 3}
m1 = %{ m | b: "two", c: "three" }
# %{a: 1, b: "two", c: "three"}
m2 = %{ m1 | a: "one" }
# %{a: "one", b: "two", c: "three"}

defmodule Subscriber do
  defstruct name: "", paid: false, over_18: true
end
s1 = %Subscriber{}
s2 = %Subscriber{ name: "Dave" }
s3 = %Subscriber{ name: "Mary", paid: true }
s4 = %Subscriber{ s3 | name: "Marie"}

defmodule Attendee do
  defstruct name: "", paid: false, over_18: true

  def may_attend_after_party(attendee = %Attendee{}) do
    attendee.paid && attendee.over_18
  end

  def print_vip_badge(%Attendee{name: name}) when name !=  "" do
    IO.puts "Very cheap badge for #{name}"
  end

  def print_vip_badge(%Attendee{}) do
    raise "missing name for badge"
  end
end
a1 = %Attendee{name: "Dave", over_18: true}
# %Attendee{name: "Dave", over_18: true, paid: false}
Attendee.may_attend_after_party(a1)
# false
a2 = %Attendee{a1 | paid: true}
Attendee.may_attend_after_party(a2)
# true
Attendee.print_vip_badge(a2)
# Very cheap badge for Dave
a3 = %Attendee{}
Attendee.print_vip_badge(a3)
# ** (RuntimeError) missing name for badge...
