defmodule Finixir.Aggregation.Tag do
  use Ecto.Schema
  import Ecto.Changeset
  alias Finixir.Aggregation.Party

  schema "tags" do
    field :tag, :string
    many_to_many :parties, Party, join_through: "parties_tags"

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:tag])
    |> validate_required([:tag])
  end
end
