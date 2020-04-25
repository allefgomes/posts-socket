defmodule PostsWeb.Router do
  use PostsWeb, :router

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

  scope "/", PostsWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/topicos", TopicoController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PostsWeb do
  #   pipe_through :api
  # end
end
