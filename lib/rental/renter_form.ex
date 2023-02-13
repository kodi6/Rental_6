defmodule Rental.RenterForm do
  use Ecto.Schema
  import Ecto.Changeset


  embedded_schema do
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
    field :aadhaar_number, :string
    field :dl_number, :string
    field :oci_number, :string
    field :pan_number, :string
    field :passport_number, :string
    field :visa_number, :string
    field :voterid_number, :string
    field :renter_id, :binary_id
  end

  def changeset(renter_form, attrs) do
    renter_form
    |> cast(attrs, [:dob,
    :emergency_contact,
    :first_name,
    :gender,
    :is_trash,
    :label,
    :nationality,
    :personal_contact,
    :stay,
    :surname,
    :aadhaar_number,
    :dl_number,
    :oci_number,
    :pan_number,
    :passport_number,
    :visa_number,
    :voterid_number])

  end

end
