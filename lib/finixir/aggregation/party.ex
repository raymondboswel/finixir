defmodule Finixir.Aggregation.Party do
  use Ecto.Schema
  alias Finixir.Aggregation.Tag
  import Ecto.Changeset

  schema "parties" do
    field :name, :string
    many_to_many :tags, Tag, join_through: "parties_tags"

    timestamps()
  end

  @doc false
  def changeset(party, attrs) do
    party
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
