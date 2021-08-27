defmodule Squad3be.Repo.Migrations.CreateShipments do
  use Ecto.Migration

  def change do
    create table(:shipments) do
      add :shipment_number, :string
      add :license_number, :string
      add :origin, :string
      add :destination, :string
      add :loading_date, :utc_datetime
      add :status, :string
      add :driver_id, references(:drivers, on_delete: :nothing)

      timestamps()
    end

    create index(:shipments, [:driver_id])
  end
end
