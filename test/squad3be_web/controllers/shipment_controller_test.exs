defmodule Squad3beWeb.ShipmentControllerTest do
  use Squad3beWeb.ConnCase

  alias Squad3be.Shipments
  alias Squad3be.Shipments.Shipment

  @create_attrs %{
    destination: "some destination",
    license_number: "some license_number",
    loading_date: "some loading_date",
    origin: "some origin",
    shipment_number: "some shipment_number",
    status: "some status"
  }
  @update_attrs %{
    destination: "some updated destination",
    license_number: "some updated license_number",
    loading_date: "some updated loading_date",
    origin: "some updated origin",
    shipment_number: "some updated shipment_number",
    status: "some updated status"
  }
  @invalid_attrs %{destination: nil, license_number: nil, loading_date: nil, origin: nil, shipment_number: nil, status: nil}

  def fixture(:shipment) do
    {:ok, shipment} = Shipments.create_shipment(@create_attrs)
    shipment
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all shipments", %{conn: conn} do
      conn = get(conn, Routes.shipment_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create shipment" do
    test "renders shipment when data is valid", %{conn: conn} do
      conn = post(conn, Routes.shipment_path(conn, :create), shipment: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.shipment_path(conn, :show, id))

      assert %{
               "id" => id,
               "destination" => "some destination",
               "license_number" => "some license_number",
               "loading_date" => "some loading_date",
               "origin" => "some origin",
               "shipment_number" => "some shipment_number",
               "status" => "some status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.shipment_path(conn, :create), shipment: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update shipment" do
    setup [:create_shipment]

    test "renders shipment when data is valid", %{conn: conn, shipment: %Shipment{id: id} = shipment} do
      conn = put(conn, Routes.shipment_path(conn, :update, shipment), shipment: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.shipment_path(conn, :show, id))

      assert %{
               "id" => id,
               "destination" => "some updated destination",
               "license_number" => "some updated license_number",
               "loading_date" => "some updated loading_date",
               "origin" => "some updated origin",
               "shipment_number" => "some updated shipment_number",
               "status" => "some updated status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, shipment: shipment} do
      conn = put(conn, Routes.shipment_path(conn, :update, shipment), shipment: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete shipment" do
    setup [:create_shipment]

    test "deletes chosen shipment", %{conn: conn, shipment: shipment} do
      conn = delete(conn, Routes.shipment_path(conn, :delete, shipment))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.shipment_path(conn, :show, shipment))
      end
    end
  end

  defp create_shipment(_) do
    shipment = fixture(:shipment)
    %{shipment: shipment}
  end
end
