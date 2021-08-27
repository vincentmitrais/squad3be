defmodule Squad3be.Repo.Migrations.CreateDrivers do
  use Ecto.Migration

  def change do
    create table(:drivers) do
      add :driver_name, :string
      add :phone_number, :string
      add :status, :boolean, default: false, null: false

      timestamps()
    end

  end
end
