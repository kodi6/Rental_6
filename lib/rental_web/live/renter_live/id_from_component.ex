defmodule RentalWeb.RenterLive.IdFromComponent do
  use RentalWeb, :live_component



alias Rental.Business.Rental


@impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage renter_id_proof records in your database.</:subtitle>
      </.header>

      <.simple_form
        :let={f}
        for={@changeset}
        id="renter_id_proof-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={{f, :label}} type="select" prompt="select ID" label="First Name" options={["Passport Number": "Passport Number", "Visa Number": "Visa Number", "OCI Number": "OCI Number", "Aadhaar Number": "Aadhaar Number", "Driving license Number": "Driving license Number", "Voter ID Number": "Voter ID Number", "PAN": "PAN"]}/>
        <.input field={{f, :number}} type="text" label="Number" />


        <:actions>
          <.button phx-disable-with="Saving...">Save User</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end


  @impl true
  def update(%{renter_id_proof: renter_id_proof} = assigns, socket) do
    changeset = Rental.change_renter_id_proof(renter_id_proof)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"renter_id_proof" => renter_id_proof_params}, socket) do
    changeset =
      socket.assigns.renter_id_proof
      |> Rental.change_renter_id_proof(renter_id_proof_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"renter_id_proof" => renter_id_proof_params}, socket) do
    save_renter_id_proof(socket, socket.assigns.action, renter_id_proof_params)
  end

  # defp save_renter_id_proof(socket, :edit, renter_id_proof_params) do
  #   case Rental.update_renter_id_proof(socket.assigns.renter_id_proof, renter_id_proof_params) do
  #     {:ok, _renter_id_proof} ->
  #       {:noreply,
  #        socket
  #        |> put_flash(:info, "User updated successfully")
  #        |> push_navigate(to: socket.assigns.navigate)}

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       {:noreply, assign(socket, :changeset, changeset)}
  #   end
  # end

  defp save_renter_id_proof(socket, :new_id, renter_id_proof_params) do
    renter_id_proof_params = Map.put(renter_id_proof_params, "renter_id", socket.assigns.renter.id)
    IO.inspect(renter_id_proof_params, label: "renter_id_proof_params")

    case Rental.create_renter_id_proof(renter_id_proof_params) do
      {:ok, _renter_id_proof} ->
        {:noreply,
         socket
         |> put_flash(:info, "User created successfully")
         |> push_navigate(to: socket.assigns.navigate)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
