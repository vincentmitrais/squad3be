defmodule Squad3be.Repo.Migrations.AddTransporter do
  use Ecto.Migration

    def change do
      alter table(:shipments) do
        add :transporter_name, :string
    end

  end
end
