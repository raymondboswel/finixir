defmodule Finixir.Repo.Migrations.AddPartyReferenceToTransactions do
  use Ecto.Migration

  def change do
    alter table(:transactions) do
      add :party_id, references(:parties, on_delete: :nilify_all)
    end
  end
end
