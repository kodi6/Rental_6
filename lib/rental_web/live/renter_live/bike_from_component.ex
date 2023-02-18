defmodule RentalWeb.RenterLive.BikeFromComponent do
  use RentalWeb, :live_component



alias Rental.Business.Rental


@impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage bike_details records in your database.</:subtitle>
      </.header>

      <.simple_form
        :let={f}
        for={@changeset}
        id="bike-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={{f, :type}} type="text" label="Type" />
        <.input field={{f, :bike_model}} type="text" label="Bike model" />
        <.input field={{f, :bike_number}} type="text" label="Bike number" />


        <:actions>
          <.button phx-disable-with="Saving...">Save User</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end


  @impl true
  def update(%{bike_details: bike_details} = assigns, socket) do
    changeset = Rental.change_bike_details(bike_details)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"bike_details" => bike_details_params}, socket) do
    changeset =
      socket.assigns.bike_details
      |> Rental.change_bike_details(bike_details_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"bike_details" => bike_details_params}, socket) do
    save_bike_details(socket, socket.assigns.action, bike_details_params)
  end

  # defp save_bike_details(socket, :edit, bike_details_params) do
  #   case Rental.update_bike_details(socket.assigns.bike_details, bike_details_params) do
  #     {:ok, _bike_details} ->
  #       {:noreply,
  #        socket
  #        |> put_flash(:info, "User updated successfully")
  #        |> push_navigate(to: socket.assigns.navigate)}

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       {:noreply, assign(socket, :changeset, changeset)}
  #   end
  # end

  defp save_bike_details(socket, :add_bike, bike_details_params) do
    bike_details_params = Map.put(bike_details_params, "renter_id", socket.assigns.renter.id)
    case Rental.create_bike_details(bike_details_params) do
      {:ok, _bike_details} ->
        {:noreply,
         socket
         |> put_flash(:info, "User created successfully")
         |> push_navigate(to: socket.assigns.navigate)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
