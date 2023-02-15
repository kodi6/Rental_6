defmodule RentalWeb.Router do



  use RentalWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {RentalWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RentalWeb do
    pipe_through :browser

    get "/", PageController, :home

    live "/renters", RenterLive.Index, :index
    live "renters/new_renter", RenterLive.Index, :new_renter

    live "/renters/:id", RenterLive.Show, :show
    live "/renters/:id/add_id", RenterLive.Show, :new_id
    live "/renters/:id/add_bike_details",RenterLive.Show, :add_bike

    # live "/renters/:id/add_trip", RenterLive.Trip, :add_trip
    # live "/renters/:id/add_bike_details", RenterLive.Trip, :add_bike

  end

  # Other scopes may use custom stacks.
  # scope "/api", RentalWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:rental, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: RentalWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
