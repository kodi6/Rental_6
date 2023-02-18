defmodule Rental.Business.Rental do
  import Ecto.Query, warn: false

  alias Rental.{
  Repo,
  Renter,
  RenterIDProof,
  BikeDetails,
  RenterForm,
  RentalStatus,
  PaymentDetails
  }


  #Renter
  def get_renter_list() do
    Repo.all(Renter)
  end

  def change_renter(%Renter{} = renter, attrs \\ %{}) do
    Renter.changeset(renter, attrs)
  end


  def get_renter(id) do
    Repo.get(Renter, id)
  end

  def create_renter(attrs \\ %{}) do
    IO.inspect(attrs, label: "attrs")
    %Renter{}
    |> Renter.changeset(attrs)
    |> Repo.insert()
  end

  def update_renter(%Renter{} = renter, attrs) do
    renter
    |> Renter.changeset(attrs)
    |> Repo.update()
  end


  def get_idproofs_by_id(renter_id) do
    Repo.get(Renter, renter_id)
    |> Repo.preload([
      :renter_id_proof,
      :rental_status,
      :bike_details,
      :payment_details,
    ])
  end

  #renter_id_proof
  def change_renter_id_proof(%RenterIDProof{} = renter_id_proof, attrs \\ %{}) do
    RenterIDProof.changeset(renter_id_proof, attrs)
  end


  def create_renter_id_proof(attrs \\ %{}) do
    %RenterIDProof{}
    |> RenterIDProof.changeset(attrs)
    |> Repo.insert()
  end



  def update_renter_id_proof(%RenterIDProof{} = renter_id_proof, attrs) do
    renter_id_proof
    |> Renter.changeset(attrs)
    |> Repo.update()
  end




  # def get_ids_by_renter_id(renter_id) do

  #   query  = from a in RenterIDProof, where: a.renter_id == ^renter_id
  #   Repo.one(query)
  # end


#renter_id_proof

def change_bike_details(%BikeDetails{} = bike_details, attrs \\ %{}) do
  BikeDetails.changeset(bike_details, attrs)
end

def create_bike_details(attrs \\ %{}) do
  %BikeDetails{}
  |> BikeDetails.changeset(attrs)
  |> Repo.insert()
end

def update_bike_details(%BikeDetails{} = bike_details, attrs) do
  bike_details
  |> BikeDetails.changeset(attrs)
  |> Repo.update()
end

#renter_form
def change_renter_form(%RenterForm{} = renter_form, attrs \\ %{}) do
  RenterForm.changeset(renter_form, attrs)
end


def create_renter_form(attrs \\ %{}) do

  # attrs = Map.put(attrs, "renter_id", renter.id)


  %PaymentDetails{}
  |> PaymentDetails.changeset(attrs)
  |> Repo.insert()

  %RentalStatus{}
  |> RentalStatus.changeset(attrs)
  |> Repo.insert()



end


end
