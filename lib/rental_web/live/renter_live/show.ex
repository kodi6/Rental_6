defmodule RentalWeb.RenterLive.Show do
  use RentalWeb, :live_view

  alias Rental.RenterIDProof
  alias Rental.Business.Rental


  def mount(_params, _session, socket) do #stage(1) socket
    {:ok, socket}
  end

  def handle_params(%{"id" => id} = params, _,socket) do #stage(2) socket, id, params
    renter = Rental.get_idproofs_by_id(id) #stage(3), renter
    socket = assign(socket, :renter, renter) #stage(4) socket
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end



  defp apply_action(socket, :show, _params) do
    socket #stage(5) socket
  end

  defp apply_action(socket, :new_id, _params) do #stage(6) socket
    socket
    |> assign(:page_title, "New ID")
    |> assign(:renter_id_proof, %RenterIDProof{}) #stage(7) socket

  end

end
