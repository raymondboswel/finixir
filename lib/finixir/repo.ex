defmodule Finixir.Repo do
  use Ecto.Repo,
    otp_app: :finixir,
    adapter: Ecto.Adapters.Postgres
end
