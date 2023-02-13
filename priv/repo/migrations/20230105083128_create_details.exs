defmodule Rental.Repo.Migrations.CreateDetails do
  use Ecto.Migration

  def change do
    create table(:details, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :type, :string
      add :bike_number, :string
      add :bike_model, :string
      add :is_trash, :boolean, default: false, null: false
      add :renter_id, references(:renters, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:details, [:renter_id])
  end
end
