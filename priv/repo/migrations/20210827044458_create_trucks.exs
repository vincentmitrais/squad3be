defmodule Squad3be.Repo.Migrations.CreateTrucks do
  use Ecto.Migration

  def change do
    create table(:trucks) do
      add :license_number, :string
      add :truck_type, :string
      add :plate_type, :string
      add :production_year, :string
      add :status, :boolean, default: false, null: false
      add :stnk, :string
      add :kir, :string

      timestamps()
    end

  end
end
