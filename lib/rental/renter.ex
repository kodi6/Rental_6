defmodule Rental.Renter do
  use Ecto.Schema
  import Ecto.Changeset

  alias Rental.{
  RenterIDProof,
  RentalStatus,
  PaymentDetails
}


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "renters" do
    field :dob, :date
    field :emergency_contact, :string
    field :first_name, :string
    field :gender, :string
    field :is_trash, :boolean, default: false
    field :label, :string
    field :nationality, :string
    field :personal_contact, :string
    field :stay, :string
    field :surname, :string

    # embeds_one :renter_id_proof, RenterIDProof
    has_one :renter_id_proof, RenterIDProof, foreign_key: :renter_id
    has_many :rental_status, RentalStatus, foreign_key: :renter_id
    has_many :bike_details, Rental.BikeDetails, foreign_key: :renter_id
    has_many :payment_details, PaymentDetails, foreign_key: :renter_id

    timestamps()
  end

  @doc false
  def changeset(renter, attrs) do
    renter
    |> cast(attrs, [:first_name, :surname, :gender, :nationality, :personal_contact, :emergency_contact, :label, :stay, :dob, :is_trash])
  end


end
