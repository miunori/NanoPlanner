defmodule NanoPlanner.Schedule do
    alias NanoPlanner.Repo
    alias NanoPlanner.Schedule.PlanItem

    def convert_datetime(items) when is_list(items) do
        Enum.map items, fn(item) ->
            convert_datetime(item)
        end
    end
    
    def convert_datetime(%PlanItem{} = item) do
        alias Timex.Timezone
        Map.merge(item, %{
          starts_at: Timezone.convert(item.starts_at, time_zone()),
          ends_at: Timezone.convert(item.ends_at, time_zone())
        })
    end

    def get_plan_item(id) do
        PlanItem
        |> Repo.get!(id)
        |> convert_datetime()
    end

    def build_plan_item do
        time0 = beginning_of_hour()
        %PlanItem{
            starts_at: Timex.shift(time0, hours: 1),
            ends_at: Timex.shift(time0, hours: 2)
        }
    end

    defp beginning_of_hour do
        %{current_time() | minute: 0, second: 0, microsecond: {0, 0}}
    end

    defp current_time do
        Timex.now(time_zone())
    end

    defp time_zone do
        Application.get_env(:nano_planner, :default_time_zone)
    end

    def change_plan_item(%PlanItem{} = item) do
        PlanItem.changeset(item, %{})
    end

    def create_plan_item(attrs) do
    item = %PlanItem{}
    cs = PlanItem.changeset(item, attrs)
    NanoPlanner.Repo.insert!(cs)
    end

    def update_plan_item(%PlanItem{} = plan_item, attrs) do
        plan_item
        |> PlanItem.changeset(attrs)
        |> Repo.update!()
    end
end
