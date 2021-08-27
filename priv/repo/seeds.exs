# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Squad3be.Repo.insert!(%Squad3be.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Squad3be.Repo
alias Squad3be.Trucks.Truck
alias Squad3be.Drivers.Driver
alias Squad3be.Shipments.Shipment

Repo.insert!(%Truck{
  license_number: "B 2021 ABC",
  truck_type: "Tranton",
  plate_type: "Yellow",
  production_year: "2001"
})

Repo.insert!(%Truck{
  license_number: "B 2213 CBE",
  truck_type: "Container",
  plate_type: "Yellow",
  production_year: "2002"
})

Repo.insert!(%Truck{
  license_number: "B 7713 FGH",
  truck_type: "CDE",
  plate_type: "Black",
  production_year: "2000"
})

jack = Repo.insert!(%Driver{driver_name: "Jack", phone_number: "+62626262", status: true})
jone = Repo.insert!(%Driver{driver_name: "Jone", phone_number: "+62691513", status: true})
joko = Repo.insert!(%Driver{driver_name: "Joko", phone_number: "+62626262", status: false})

Repo.insert!(%Shipment{
  shipment_number: "DO-722947",
  license_number: "B4922 UTT",
  driver_id: jack.id,
  origin: "Jakarta",
  destination: "Surabaya",
  loading_date: NaiveDateTime.local_now(),
  status: "On going to origin"
})
