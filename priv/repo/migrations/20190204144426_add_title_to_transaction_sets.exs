defmodule Finixir.Repo.Migrations.AddTitleToTransactionSets do
  use Ecto.Migration

  def change do
    alter table(:transaction_sets) do
      add :title, :string
    end
  end
end
