defmodule Rental.RenterIDProof do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "proofs" do
    field :aadhaar_number, :string
    field :dl_number, :string
    field :is_trash, :boolean, default: false
    field :oci_number, :string
    field :pan_number, :string
    field :passport_number, :string
    field :visa_number, :string
    field :voterid_number, :string
    field :renter_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(renter_id_proof, attrs) do
    renter_id_proof
    |> cast(attrs, [:passport_number, :visa_number, :oci_number, :aadhaar_number, :dl_number, :voterid_number, :pan_number, :renter_id])
    |> validate_required([:renter_id])
  end
end
