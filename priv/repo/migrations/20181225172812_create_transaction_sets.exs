defmodule Finixir.Repo.Migrations.CreateTransactionSets do
  use Ecto.Migration

  def change do
    create table(:transaction_sets) do
      add :start_date, :date
      add :end_date, :date

      timestamps()
    end

  end
end
