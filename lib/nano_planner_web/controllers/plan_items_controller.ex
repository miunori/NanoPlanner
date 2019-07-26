defmodule NanoPlannerWeb.PlanItemsController do
  use NanoPlannerWeb, :controller
  import Ecto.Query
  import Ecto.Changeset
  alias NanoPlanner.Repo
  alias NanoPlanner.PlanItem

  def index(conn, _params) do
    #plan_items = Repo.all(Ecto.Query.order_by(PlanItem, asc: :starts_at))
    plan_items =
      PlanItem
        |> order_by(desc: :starts_at, asc: :ends_at, asc: :id)
        |> Repo.all
        |> PlanItem.convert_datetime
    render conn, "index.html", plan_items: plan_items
  end

  def show(conn, params) do
    plan_item =
      PlanItem
        |> Repo.get!(params["id"])
        |> PlanItem.convert_datetime
    render conn, "show.html", plan_item: plan_item
  end

  def new(conn, _params) do
    plan_item = %PlanItem{}
    changeset = Ecto.Changeset.cast(plan_item, %{}, [:name, :description, :starts_at, :ends_at])
    render conn, "new.html", changeset: changeset
  end
end
