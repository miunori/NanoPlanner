defmodule NanoPlanner.PlanItem do
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

  def convert_datetime(items) when is_list(items) do
    Enum.map items, fn(item) ->
      convert_datetime(item)
    end
  end

  def convert_datetime(%__MODULE__{} = item) do
    alias Timex.Timezone
    time_zone = Application.get_env(:nano_planner, :default_time_zone)

    Map.merge(item, %{
      starts_at: Timezone.convert(item.starts_at, time_zone),
      ends_at: Timezone.convert(item.ends_at, time_zone)
    })
  end
end
