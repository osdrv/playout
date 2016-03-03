defmodule Playout.Router do
  use Playout.Web, :router

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

  scope "/", Playout do
    pipe_through :browser # Use the default browser stack

    get "/bundles", BundleController, :index 
    get "/bundles/:id", BundleController, :show
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Playout do
  #   pipe_through :api
  # end
end
