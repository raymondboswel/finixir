defmodule Finixir.Repo.Migrations.CreateTransactionTypes do
  use Ecto.Migration

  def change do
    create table(:transaction_types) do
      add :transaction_type, :string

      timestamps()
    end

  end
end
