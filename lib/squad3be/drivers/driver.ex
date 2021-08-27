defmodule Squad3be.Drivers.Driver do
  use Ecto.Schema
  import Ecto.Changeset

  schema "drivers" do
    field :driver_name, :string
    field :phone_number, :string
    field :status, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(driver, attrs) do
    driver
    |> cast(attrs, [:driver_name, :phone_number, :status])
    |> validate_required([:driver_name, :phone_number, :status])
  end
end
