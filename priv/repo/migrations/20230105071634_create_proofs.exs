defmodule Rental.Repo.Migrations.CreateProofs do
  use Ecto.Migration

  def change do
    create table(:proofs, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :label, :string
      add :number, :string
      add :is_trash, :boolean, default: false, null: false
      add :renter_id, references(:renters, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:proofs, [:renter_id])
  end
end
