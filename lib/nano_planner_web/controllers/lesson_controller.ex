defmodule NanoPlannerWeb.LessonController do
  use NanoPlannerWeb, :controller

  def form(conn, _params) do
    render(conn, "form.html")
  end

  def register(conn, %{"user_name" => user_name}) do
    render(conn, "register.html", user_name: user_name)
  end

  def hello(conn, _params) do
    render(conn, "hello.html")
  end
end
