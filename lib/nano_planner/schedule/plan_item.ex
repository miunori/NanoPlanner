defmodule NanoPlanner.Schedule.PlanItem do
  use Ecto.Schema
  import Ecto.Changeset
  alias NanoPlanner.Schedule.PlanItem

  schema "plan_items" do
    field :name, :string
    field :description, :string
    field :starts_at, NanoPlanner.Ecto.Datetime
    field :ends_at, NanoPlanner.Ecto.Datetime

    timestamps()
  end

  @doc false
  def changeset(plan_item, attrs) do
    plan_item
    |> cast(attrs, [])
    |> validate_required([])
  end
end
