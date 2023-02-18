defmodule RentalWeb.RenterLive.TripFromComponent do
  use RentalWeb, :live_component



alias Rental.Business.Rental


@impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage renter_form records in your database.</:subtitle>
      </.header>

      <.simple_form
        :let={f}
        for={@changeset}
        id="trip-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >



        <.input field={{f, :trip_no}} type="text" label="Trip No" />
        <.input field={{f, :drop_time}} type="time" label="Drop time" />

        <.input field={{f, :estimated_end_date}} type="date" label="Estimated end date" />
        <.input field={{f, :returned_date}} type="date" label="returned_date" />


        <.input field={{f, :pickup_time}} type="time" label="Pickup time" />

        <.input field={{f, :start_date}} type="date" label="Start date" />

        <.input field={{f, :amount_paid}} type="text" label="amount paid" />

        <.input field={{f, :date}} type="date" label="date" />

        <.input field={{f, :paid}} type="text" label="paid" />

        <.input field={{f, :payment_mode}} type="text" label="payment_mode" />
        <.input field={{f, :pending_amount}} type="text" label="pending_amount" />

        <.input field={{f, :time}} type="time" label="time" />

        <.input field={{f, :total_amount}} type="text" label="total_amount" />




        <:actions>
          <.button phx-disable-with="Saving...">Save User</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end


  @impl true
  def update(%{renter_form: renter_form} = assigns, socket) do
    changeset = Rental.change_renter_form(renter_form)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"renter_form" => renter_form_params}, socket) do
    changeset =
      socket.assigns.renter_form
      |> Rental.change_renter_form(renter_form_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"renter_form" => renter_form_params}, socket) do
    save_renter_form(socket, socket.assigns.action, renter_form_params)
  end

  # defp save_renter_form(socket, :edit, renter_form_params) do
  #   case Rental.update_renter_form(socket.assigns.renter_form, renter_form_params) do
  #     {:ok, _renter_form} ->
  #       {:noreply,
  #        socket
  #        |> put_flash(:info, "User updated successfully")
  #        |> push_navigate(to: socket.assigns.navigate)}

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       {:noreply, assign(socket, :changeset, changeset)}
  #   end
  # end

  defp save_renter_form(socket, :add_trip, renter_form_params) do
    renter_form_params = Map.put(renter_form_params, "renter_id", socket.assigns.renter.id)
    case Rental.create_renter_form(renter_form_params) do
      {:ok, _renter_form} ->
        {:noreply,
         socket
         |> put_flash(:info, "User created successfully")
         |> push_navigate(to: socket.assigns.navigate)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
