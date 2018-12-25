defmodule Finixir.Repo.Migrations.AddTransactionSetReferenceToTransactions do
  use Ecto.Migration

  def change do
    alter table(:transactions) do
      add :transaction_set_id, references(:transaction_sets, on_delete: :delete_all)
    end
  end
end
