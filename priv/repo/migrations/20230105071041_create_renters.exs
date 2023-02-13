defmodule Rental.Repo.Migrations.CreateRenters do
  use Ecto.Migration

  def change do
    create table(:renters, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :first_name, :string
      add :surname, :string
      add :gender, :string
      add :nationality, :string
      add :personal_contact, :string
      add :emergency_contact, :string
      add :label, :string
      add :stay, :string
      add :dob, :date

      add :is_trash, :boolean, default: false, null: false

      timestamps()
    end
  end
end
