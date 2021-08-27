defmodule Squad3beWeb.TruckView do
  use Squad3beWeb, :view
  alias Squad3beWeb.TruckView

  def render("index.json", %{trucks: trucks}) do
    %{data: render_many(trucks, TruckView, "truck.json")}
  end

  def render("show.json", %{truck: truck}) do
    %{data: render_one(truck, TruckView, "truck.json")}
  end

  def render("truck.json", %{truck: truck}) do
    %{id: truck.id,
      license_number: truck.license_number,
      truck_type: truck.truck_type,
      plate_type: truck.plate_type,
      production_year: truck.production_year,
      status: truck.status,
      stnk: truck.stnk,
      kir: truck.kir}
  end
end
