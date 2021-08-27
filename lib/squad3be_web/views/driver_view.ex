defmodule Squad3beWeb.DriverView do
  use Squad3beWeb, :view
  alias Squad3beWeb.DriverView

  def render("index.json", %{drivers: drivers}) do
    %{data: render_many(drivers, DriverView, "driver.json")}
  end

  def render("show.json", %{driver: driver}) do
    %{data: render_one(driver, DriverView, "driver.json")}
  end

  def render("driver.json", %{driver: driver}) do
    %{id: driver.id,
      driver_name: driver.driver_name,
      phone_number: driver.phone_number,
      status: driver.status}
  end
end
