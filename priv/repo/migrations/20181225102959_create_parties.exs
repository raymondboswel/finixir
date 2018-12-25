defmodule Finixir.Repo.Migrations.CreateParties do
  use Ecto.Migration

  def change do
    create table(:parties) do
      add :name, :string

      timestamps()
    end

  end
end
