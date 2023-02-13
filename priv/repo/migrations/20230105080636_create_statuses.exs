defmodule Rental.Repo.Migrations.CreateStatuses do
  use Ecto.Migration

  def change do
    create table(:statuses, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :trip_no, :string
      add :start_date, :date
      add :estimated_end_date, :date
      add :returned_date, :date
      add :pickup_time, :time
      add :drop_time, :time
      add :is_trash, :boolean, default: false, null: false
      add :renter_id, references(:renters, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:statuses, [:renter_id])
  end
end
