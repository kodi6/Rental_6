defmodule Rental.BikeDetails do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "details" do
    field :bike_model, :string
    field :bike_number, :string
    field :is_trash, :boolean, default: false
    field :type, :string
    field :renter_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(bike_details, attrs) do
    bike_details
    |> cast(attrs, [:type, :bike_number, :bike_model, :is_trash])
    |> validate_required([:type, :bike_number, :bike_model, :is_trash])
  end
end
