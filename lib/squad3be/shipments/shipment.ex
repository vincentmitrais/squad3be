defmodule Squad3be.Shipments.Shipment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shipments" do
    field :destination, :string
    field :license_number, :string
    field :loading_date, :naive_datetime
    field :origin, :string
    field :shipment_number, :string
    field :status, :string
    field :transporter_name, :string
    belongs_to :driver, Squad3be.Drivers.Driver

    timestamps()
  end

  @doc false
  def changeset(shipment, attrs) do
    shipment
    |> cast(attrs, [
      :shipment_number,
      :license_number,
      :origin,
      :destination,
      :loading_date,
      :status
    ])
    |> validate_required([:shipment_number, :license_number, :origin, :destination])
  end

  def transport_changeset(shipment, attrs) do
    shipment
    |> cast(attrs, [
      :transporter_name
    ])
    |> validate_required([:transporter_name])
  end
end
