# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rental.Repo.insert!(%Rental.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# Rental.Repo.insert!(%Rental.Renter{
# dob: ~D[1970-01-01],
# emergency_contact: "764377883",
# first_name: "kodi",
# gender: "bank",
# is_trash: true,
# label: "local",
# nationality: "indian",
# personal_contact: "878743987",
# stay: "rohini",
# surname: "bank"
# })


# Rental.Repo.insert!(%Rental.Renter{
#   dob: ~D[1973-01-01],
#   emergency_contact: "764376883",
#   first_name: "peter",
#   gender: "male",
#   is_trash: true,
#   label: "home",
#   nationality: "uk",
#   personal_contact: "878443987",
#   stay: "inustries",
#   surname: "parker"
#   })



  renter = Rental.Repo.insert!(%Rental.Renter{
    dob: ~D[1973-01-01],
    emergency_contact: "764876883",
    first_name: "tony",
    gender: "male",
    is_trash: true,
    label: "local",
    nationality: "us",
    personal_contact: "878643987",
    stay: "inustries",
    surname: "stark"
    })


    Rental.Repo.insert!(%Rental.RenterIDProof{
      aadhaar_number: "76878474",
      oci_number: "1"
      renter_id: renter.id
    })
