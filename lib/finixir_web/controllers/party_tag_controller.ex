defmodule FinixirWeb.PartyTagController do
  use FinixirWeb, :controller

  alias Finixir.Aggregation
  alias Finixir.Aggregation.PartyTag

  action_fallback FinixirWeb.FallbackController

  def index(conn, _params) do
    parties_tags = Aggregation.list_parties_tags()
    render(conn, "index.json", parties_tags: parties_tags)
  end

  def create(conn, %{"party_tag" => party_tag_params}) do
    with {:ok, %PartyTag{} = party_tag} <- Aggregation.create_party_tag(party_tag_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.party_tag_path(conn, :show, party_tag))
      |> render("show.json", party_tag: party_tag)
    end
  end

  def show(conn, %{"id" => id}) do
    party_tag = Aggregation.get_party_tag!(id)
    render(conn, "show.json", party_tag: party_tag)
  end

  def update(conn, %{"id" => id, "party_tag" => party_tag_params}) do
    party_tag = Aggregation.get_party_tag!(id)

    with {:ok, %PartyTag{} = party_tag} <- Aggregation.update_party_tag(party_tag, party_tag_params) do
      render(conn, "show.json", party_tag: party_tag)
    end
  end

  def delete(conn, %{"id" => id}) do
    party_tag = Aggregation.get_party_tag!(id)

    with {:ok, %PartyTag{}} <- Aggregation.delete_party_tag(party_tag) do
      send_resp(conn, :no_content, "")
    end
  end
end
