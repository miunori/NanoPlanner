alias NanoPlanner.PlanItem 

item = %PlanItem{}
params = %{
    "name" => "Test",
    "description" => "Experience",
    "starts_at" => "2019-07-07",
    "ends_at" => "2019-07-31",
}

fields = [:name, :description, :starts_at, :ends_at]
cs = Ecto.Changeset.cast(item, params, fields)

IO.inspect(Map.keys(cs))
IO.inspect(cs.data == item)
IO.inspect(cs.params == params)
IO.inspect(cs.changes)
