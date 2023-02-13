defmodule RentalWeb.RenterLive.Index do
  use RentalWeb, :live_view


  alias Rental.Renter
  alias Rental.Business.Rental

  def mount(_params, _session, socket) do
    {:ok,
     socket
    |> assign(:renters, Rental.get_renter_list())}
  end

  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  def apply_action(socket, :new_renter, _params) do
    socket
    |> assign(:page_title, "New renter")
    |> assign(:renter, %Renter{})

  end

  def apply_action(socket, :index, _params) do
    socket
  end

end
