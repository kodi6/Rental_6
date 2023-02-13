defmodule Rental.Repo.Migrations.CreateProofs do
  use Ecto.Migration

  def change do
    create table(:proofs, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :passport_number, :string
      add :visa_number, :string
      add :oci_number, :string
      add :aadhaar_number, :string
      add :dl_number, :string
      add :voterid_number, :string
      add :pan_number, :string
      add :is_trash, :boolean, default: false, null: false
      add :renter_id, references(:renters, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:proofs, [:renter_id])
  end
end
