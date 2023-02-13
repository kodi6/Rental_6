defmodule RentalWeb.RenterLive.RenterFromComponent do
  use RentalWeb, :live_component



alias Rental.Business.Rental


@impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage renter records in your database.</:subtitle>
      </.header>

      <.simple_form
        :let={f}
        for={@changeset}
        id="renter-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={{f, :first_name}} type="text" label="First Name" />
        <.input field={{f, :surname}} type="text" label="Surname" />
        <.input field={{f, :gender}} type="select" label="Gender" prompt="Choose gender" options={["Male", "Female", "Transgender"]}/>
        <.input field={{f, :nationality}} type="text" label="Nationality" />
        <.input field={{f, :dob}} type="date" label="DOB" />
        <.input field={{f, :personal_contact}} type="text" label="Personal Contact" />
        <.input field={{f, :emergency_contact}} type="text" label="Emergency Contact" />
        <.input field={{f, :stay}} type="text" label="Stay" />

        <:actions>
          <.button phx-disable-with="Saving...">Save User</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end


  @impl true
  def update(%{renter: renter} = assigns, socket) do
    changeset = Rental.change_renter(renter)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"renter" => renter_params}, socket) do
    changeset =
      socket.assigns.renter
      |> Rental.change_renter(renter_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"renter" => renter_params}, socket) do
    save_renter(socket, socket.assigns.action, renter_params)
  end

  defp save_renter(socket, :edit, renter_params) do
    case Rental.update_renter(socket.assigns.renter, renter_params) do
      {:ok, _renter} ->
        {:noreply,
         socket
         |> put_flash(:info, "User updated successfully")
         |> push_navigate(to: socket.assigns.navigate)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_renter(socket, :new_renter, renter_params) do
    case Rental.create_renter(renter_params) do
      {:ok, _renter} ->
        {:noreply,
         socket
         |> put_flash(:info, "User created successfully")
         |> push_navigate(to: socket.assigns.navigate)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
