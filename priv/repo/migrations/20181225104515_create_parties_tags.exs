defmodule Finixir.Repo.Migrations.CreatePartiesTags do
  use Ecto.Migration

  def change do
    create table(:parties_tags) do
      add :party_id, references(:parties, on_delete: :nothing)
      add :tag_id, references(:tags, on_delete: :nothing)

      timestamps()
    end

    create index(:parties_tags, [:party_id])
    create index(:parties_tags, [:tag_id])
  end
end
