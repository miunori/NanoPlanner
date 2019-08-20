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
    resources(
      "/plan_items",
      PlanItemsController,
        only: [:index, :new, :create, :show, :edit, :update]
    )
  end

  # Other scopes may use custom stacks.
  # scope "/api", NanoPlannerWeb do
  #   pipe_through :api
  # end
end
