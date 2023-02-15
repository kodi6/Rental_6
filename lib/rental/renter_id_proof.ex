defmodule Rental.RenterIDProof do
  use Ecto.Schema
  import Ecto.Changeset

  @valid_labels ["Passport Number", "Visa Number", "OCI Number", "Aadhaar Number", "Driving license Number", "Voter ID Number", "PAN"]
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "proofs" do
    field :number, :string
    field :label, :string
    field :is_trash, :boolean, default: false
    field :renter_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(renter_id_proof, attrs) do
    renter_id_proof
    |> cast(attrs, [:number, :label, :renter_id])
    |> validate_required([:renter_id])
    |> validate_inclusion(:label, @valid_labels)
  end
end
