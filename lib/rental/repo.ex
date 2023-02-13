defmodule Rental.Repo do
  use Ecto.Repo,
    otp_app: :rental,
    adapter: Ecto.Adapters.Postgres
end
