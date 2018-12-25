defmodule Finixir.Aggregation.PartyTag do
  use Ecto.Schema
  import Ecto.Changeset


  schema "parties_tags" do
    field :party_id, :id
    field :tag_id, :id

    timestamps()
  end

  @doc false
  def changeset(party_tag, attrs) do
    party_tag
    |> cast(attrs, [])
    |> validate_required([])
  end
end
