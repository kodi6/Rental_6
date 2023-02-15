# defmodule RentalWeb.RenterLive.Trip do
#   use RentalWeb, :live_view

#   alias Rental.BikeDetails
#   alias Rental.Business.Rental


#   def mount(_params, _session, socket) do
#     {:ok, socket}
#   end






#   def handle_params(%{"id" => id} = params, _, socket) do
#     renter = Rental.get_idproofs_by_id(id)
#     socket = assign(socket, :renter, renter)
#     {:noreply, apply_action(socket, socket.assigns.live_action, params)}
#   end


#   defp apply_action(socket, :add_trip, _params) do
#     socket
#   end

#   defp apply_action(socket, :new_id, _params) do
#     socket
#     |> assign(:page_title, "Bikes details")
#     |> assign(:renter_id_proof, %BikeDetails{})
#   end

# end
