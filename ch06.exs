(1..10) |> Enum.map(&(&1*&1)) |> Enum.filter(&(&1 < 40))

# • Get the customer list.
# • Generate a list of their orders.
# • Calculate tax on the orders.
# • Prepare the filing.
DB.find_customers
  |> Orders.for_customers
  |> sales_tax(2018)
  |> prepare_filing
