defmodule Rental.RenterForm do
  use Ecto.Schema
  import Ecto.Changeset


  embedded_schema do
    field :renter_id, :binary_id
    field :drop_time, :time
    field :estimated_end_date, :date
    field :is_trash, :boolean, default: false
    field :pickup_time, :time
    field :returned_date, :date
    field :start_date, :date
    field :trip_no, :string

    field :amount_paid, :string
    field :date, :date
    field :paid, :string
    field :payment_mode, :string
    field :pending_amount, :string
    field :time, :time
    field :total_amount, :string

  end

  def changeset(renter_form, attrs) do
    renter_form
    |> cast(attrs, [:trip_no, :renter_id])

  end

end
