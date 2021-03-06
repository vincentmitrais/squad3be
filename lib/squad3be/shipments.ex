defmodule Squad3be.Shipments do
  @moduledoc """
  The Shipments context.
  """

  import Ecto.Query, warn: false
  alias Squad3be.Repo

  alias Squad3be.Shipments.Shipment

  @doc """
  Returns the list of shipments.

  ## Examples

      iex> list_shipments()
      [%Shipment{}, ...]

  """
  def list_shipments do
    Repo.all(Shipment)
  end

  @doc """
  Gets a single shipment.

  Raises `Ecto.NoResultsError` if the Shipment does not exist.

  ## Examples

      iex> get_shipment!(123)
      %Shipment{}

      iex> get_shipment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_shipment!(id), do: Repo.get!(Shipment, id)

  def get_shipment_by_number!(shipsment_number) do
    Repo.get_by!(Shipment, shipment_number: shipsment_number)
  end

  def allocate_tarnsporter(%Shipment{} = shipment, attrs) do
    shipment
    |> Shipment.transport_changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Creates a shipment.

  ## Examples

      iex> create_shipment(%{field: value})
      {:ok, %Shipment{}}

      iex> create_shipment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_shipment(attrs \\ %{}) do
    %Shipment{}
    |> Shipment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a shipment.

  ## Examples

      iex> update_shipment(shipment, %{field: new_value})
      {:ok, %Shipment{}}

      iex> update_shipment(shipment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_shipment(%Shipment{} = shipment, attrs) do
    shipment
    |> Shipment.changeset(attrs)
    |> Repo.update()
  end

  def update_driver_and_truck(%Shipment{} = shipment, attrs) do
    shipment
    |> Shipment.truck_driver_changeset(attrs)
    |> Repo.update()
    |> case do
      {:ok, shipment} -> Repo.preload(shipment, [:truck, :driver])
      {:error, _} = changeset -> changeset
    end
  end

  @doc """
  Deletes a shipment.

  ## Examples

      iex> delete_shipment(shipment)
      {:ok, %Shipment{}}

      iex> delete_shipment(shipment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_shipment(%Shipment{} = shipment) do
    Repo.delete(shipment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking shipment changes.

  ## Examples

      iex> change_shipment(shipment)
      %Ecto.Changeset{data: %Shipment{}}

  """
  def change_shipment(%Shipment{} = shipment, attrs \\ %{}) do
    Shipment.changeset(shipment, attrs)
  end
end
