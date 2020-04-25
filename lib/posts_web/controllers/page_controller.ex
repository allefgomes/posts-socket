defmodule PostsWeb.PageController do
  use PostsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
