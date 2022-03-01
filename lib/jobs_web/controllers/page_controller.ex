defmodule JobsWeb.PageController do
  use JobsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
