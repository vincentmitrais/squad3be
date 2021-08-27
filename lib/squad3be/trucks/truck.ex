defmodule Squad3be.Trucks.Truck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trucks" do
    field :kir, :string
    field :license_number, :string
    field :plate_type, :string
    field :production_year, :string
    field :status, :boolean, default: false
    field :stnk, :string
    field :truck_type, :string

    timestamps()
  end

  @doc false
  def changeset(truck, attrs) do
    truck
    |> cast(attrs, [
      :license_number,
      :truck_type,
      :plate_type,
      :production_year,
      :status,
      :stnk,
      :kir
    ])
    |> validate_required([:license_number, :truck_type, :plate_type, :stnk])
  end
end
