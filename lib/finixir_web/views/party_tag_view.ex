defmodule FinixirWeb.PartyTagView do
  use FinixirWeb, :view
  alias FinixirWeb.PartyTagView

  def render("index.json", %{parties_tags: parties_tags}) do
    %{data: render_many(parties_tags, PartyTagView, "party_tag.json")}
  end

  def render("show.json", %{party_tag: party_tag}) do
    %{data: render_one(party_tag, PartyTagView, "party_tag.json")}
  end

  def render("party_tag.json", %{party_tag: party_tag}) do
    %{id: party_tag.id}
  end
end
