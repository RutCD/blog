defmodule BlogProjectWeb.PageController do
  use BlogProjectWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
