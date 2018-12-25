defmodule FinixirWeb.PartyController do
  use FinixirWeb, :controller

  alias Finixir.Aggregation
  alias Finixir.Aggregation.Party

  action_fallback FinixirWeb.FallbackController

  def index(conn, _params) do
    parties = Aggregation.list_parties()
    render(conn, "index.json", parties: parties)
  end

  def create(conn, %{"party" => party_params}) do
    with {:ok, %Party{} = party} <- Aggregation.create_party(party_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.party_path(conn, :show, party))
      |> render("show.json", party: party)
    end
  end

  def show(conn, %{"id" => id}) do
    party = Aggregation.get_party!(id)
    render(conn, "show.json", party: party)
  end

  def update(conn, %{"id" => id, "party" => party_params}) do
    party = Aggregation.get_party!(id)

    with {:ok, %Party{} = party} <- Aggregation.update_party(party, party_params) do
      render(conn, "show.json", party: party)
    end
  end

  def delete(conn, %{"id" => id}) do
    party = Aggregation.get_party!(id)

    with {:ok, %Party{}} <- Aggregation.delete_party(party) do
      send_resp(conn, :no_content, "")
    end
  end
end
