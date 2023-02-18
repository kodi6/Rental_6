defmodule Rental.PaymentDetails do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "payments" do
    field :amount_paid, :string
    field :date, :date
    field :is_trash, :boolean, default: false
    field :paid, :string
    field :payment_mode, :string
    field :pending_amount, :string
    field :time, :time
    field :total_amount, :string
    field :renter_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(payment_details, attrs) do
    payment_details
    |> cast(attrs, [:total_amount, :amount_paid, :pending_amount, :paid, :payment_mode, :date, :time, :is_trash, :renter_id])
    |> validate_required([:total_amount, :amount_paid, :pending_amount, :paid, :payment_mode, :date, :time, :is_trash, :renter_id])
  end
end
