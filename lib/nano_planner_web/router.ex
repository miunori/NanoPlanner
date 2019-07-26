defmodule NanoPlannerWeb.Router do
  use NanoPlannerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", NanoPlannerWeb do
    pipe_through :browser

    get "/", TopController, :index
    get "/lesson/form", LessonController, :form
    get "/lesson/register", LessonController, :register
    get "/plan_items", PlanItemsController, :index
    get "/plan_items/new", PlanItemsController, :new
    post "/plan_items/create", PlanItemsController, :create
    get "/plan_items/:id", PlanItemsController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", NanoPlannerWeb do
  #   pipe_through :api
  # end
end
