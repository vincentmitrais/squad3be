defmodule Squad3beWeb.ShipmentView do
  use Squad3beWeb, :view
  alias Squad3beWeb.{ShipmentView, DriverView, TruckView}

  def render("index.json", %{shipments: shipments}) do
    %{data: render_many(shipments, ShipmentView, "shipment.json")}
  end

  def render("show.json", %{shipment: shipment}) do
    %{data: render_one(shipment, ShipmentView, "shipment.json")}
  end

  def render("allocate.json", %{shipment: shipment}) do
    %{
      data: render_one(shipment, ShipmentView, "shipment.json"),
      driver: render_one(shipment.driver, DriverView, "driver.json"),
      truck: render_one(shipment.truck, TruckView, "truck.json")
    }
  end

  def render("shipment.json", %{shipment: shipment}) do
    %{
      id: shipment.id,
      shipment_number: shipment.shipment_number,
      license_number: shipment.license_number,
      origin: shipment.origin,
      destination: shipment.destination,
      loading_date: shipment.loading_date,
      status: shipment.status,
      transporter: shipment.transporter_name
    }
  end
end
