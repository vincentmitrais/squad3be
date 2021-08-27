defmodule Squad3be.Repo.Migrations.AddTruckAndDriver do
  use Ecto.Migration

  def change do
    alter table(:shipments) do
      add :truck_id, references(:trucks, on_delete: :nothing)
    end
  end
end
