defmodule FinixirWeb.PartyTagControllerTest do
  use FinixirWeb.ConnCase

  alias Finixir.Aggregation
  alias Finixir.Aggregation.PartyTag

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:party_tag) do
    {:ok, party_tag} = Aggregation.create_party_tag(@create_attrs)
    party_tag
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all parties_tags", %{conn: conn} do
      conn = get(conn, Routes.party_tag_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create party_tag" do
    test "renders party_tag when data is valid", %{conn: conn} do
      conn = post(conn, Routes.party_tag_path(conn, :create), party_tag: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.party_tag_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.party_tag_path(conn, :create), party_tag: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update party_tag" do
    setup [:create_party_tag]

    test "renders party_tag when data is valid", %{conn: conn, party_tag: %PartyTag{id: id} = party_tag} do
      conn = put(conn, Routes.party_tag_path(conn, :update, party_tag), party_tag: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.party_tag_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, party_tag: party_tag} do
      conn = put(conn, Routes.party_tag_path(conn, :update, party_tag), party_tag: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete party_tag" do
    setup [:create_party_tag]

    test "deletes chosen party_tag", %{conn: conn, party_tag: party_tag} do
      conn = delete(conn, Routes.party_tag_path(conn, :delete, party_tag))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.party_tag_path(conn, :show, party_tag))
      end
    end
  end

  defp create_party_tag(_) do
    party_tag = fixture(:party_tag)
    {:ok, party_tag: party_tag}
  end
end
