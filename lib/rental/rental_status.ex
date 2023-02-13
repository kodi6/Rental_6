defmodule Rental.RentalStatus do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "statuses" do
    field :drop_time, :time
    field :estimated_end_date, :date
    field :is_trash, :boolean, default: false
    field :pickup_time, :time
    field :returned_date, :date
    field :start_date, :date
    field :trip_no, :string
    field :renter_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(rental_status, attrs) do
    rental_status
    |> cast(attrs, [:trip_no, :start_date, :estimated_end_date, :returned_date, :pickup_time, :drop_time, :is_trash])
    |> validate_required([:trip_no, :start_date, :estimated_end_date, :returned_date, :pickup_time, :drop_time, :is_trash])
  end
end
