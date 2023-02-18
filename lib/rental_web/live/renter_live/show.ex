defmodule RentalWeb.RenterLive.Show do
  use RentalWeb, :live_view


  alias Rental.RenterForm
  alias Rental.RenterIDProof
  alias Rental.BikeDetails
  alias Rental.Business.Rental

  def mount(_params, _session, socket) do

    {:ok, socket}
  end






  def handle_params(%{"id" => id} = params, _, socket) do
    renter = Rental.get_idproofs_by_id(id)
    dbg(renter)
    socket = assign(socket, :renter, renter)
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end


  defp apply_action(socket, :show, _params) do
    socket
  end


  defp apply_action(socket, :new_id, _params) do
    socket
    |> assign(:page_title, "New ID")
    |> assign(:renter_id_proof, %RenterIDProof{})
  end

  defp apply_action(socket, :add_bike, _params) do
    socket
    |> assign(:page_title, "Bikes details")
    |> assign(:bike_details, %BikeDetails{})
  end

  defp apply_action(socket, :add_trip, _params) do
    socket
    |> assign(:page_title, "Add Trip")
    |> assign(:renter_form, %RenterForm{})
  end


end
