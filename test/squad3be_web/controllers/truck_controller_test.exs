defmodule Squad3beWeb.TruckControllerTest do
  use Squad3beWeb.ConnCase

  alias Squad3be.Trucks
  alias Squad3be.Trucks.Truck

  @create_attrs %{
    kir: "some kir",
    license_number: "some license_number",
    plate_type: "some plate_type",
    production_year: "some production_year",
    status: true,
    stnk: "some stnk",
    truck_type: "some truck_type"
  }
  @update_attrs %{
    kir: "some updated kir",
    license_number: "some updated license_number",
    plate_type: "some updated plate_type",
    production_year: "some updated production_year",
    status: false,
    stnk: "some updated stnk",
    truck_type: "some updated truck_type"
  }
  @invalid_attrs %{kir: nil, license_number: nil, plate_type: nil, production_year: nil, status: nil, stnk: nil, truck_type: nil}

  def fixture(:truck) do
    {:ok, truck} = Trucks.create_truck(@create_attrs)
    truck
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all trucks", %{conn: conn} do
      conn = get(conn, Routes.truck_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create truck" do
    test "renders truck when data is valid", %{conn: conn} do
      conn = post(conn, Routes.truck_path(conn, :create), truck: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.truck_path(conn, :show, id))

      assert %{
               "id" => id,
               "kir" => "some kir",
               "license_number" => "some license_number",
               "plate_type" => "some plate_type",
               "production_year" => "some production_year",
               "status" => true,
               "stnk" => "some stnk",
               "truck_type" => "some truck_type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.truck_path(conn, :create), truck: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update truck" do
    setup [:create_truck]

    test "renders truck when data is valid", %{conn: conn, truck: %Truck{id: id} = truck} do
      conn = put(conn, Routes.truck_path(conn, :update, truck), truck: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.truck_path(conn, :show, id))

      assert %{
               "id" => id,
               "kir" => "some updated kir",
               "license_number" => "some updated license_number",
               "plate_type" => "some updated plate_type",
               "production_year" => "some updated production_year",
               "status" => false,
               "stnk" => "some updated stnk",
               "truck_type" => "some updated truck_type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, truck: truck} do
      conn = put(conn, Routes.truck_path(conn, :update, truck), truck: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete truck" do
    setup [:create_truck]

    test "deletes chosen truck", %{conn: conn, truck: truck} do
      conn = delete(conn, Routes.truck_path(conn, :delete, truck))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.truck_path(conn, :show, truck))
      end
    end
  end

  defp create_truck(_) do
    truck = fixture(:truck)
    %{truck: truck}
  end
end
