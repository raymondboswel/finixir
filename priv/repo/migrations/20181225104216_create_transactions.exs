defmodule Finixir.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :transaction_date, :date
      add :amount, :float
      add :transaction_type_id, references(:transaction_types, on_delete: :nothing)

      timestamps()
    end

    create index(:transactions, [:transaction_type_id])
  end
end
