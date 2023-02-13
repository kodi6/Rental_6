defmodule Rental.Repo.Migrations.CreatePayments do
  use Ecto.Migration

  def change do
    create table(:payments, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :total_amount, :string
      add :amount_paid, :string
      add :pending_amount, :string
      add :paid, :string
      add :payment_mode, :string
      add :date, :date
      add :time, :time
      add :is_trash, :boolean, default: false, null: false
      add :renter_id, references(:renters, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:payments, [:renter_id])
  end
end
