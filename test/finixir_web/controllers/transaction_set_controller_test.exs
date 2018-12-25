defmodule FinixirWeb.TransactionSetControllerTest do
  use FinixirWeb.ConnCase

  alias Finixir.Aggregation
  alias Finixir.Aggregation.TransactionSet

  @create_attrs %{
    end_date: ~D[2010-04-17],
    start_date: ~D[2010-04-17]
  }
  @update_attrs %{
    end_date: ~D[2011-05-18],
    start_date: ~D[2011-05-18]
  }
  @invalid_attrs %{end_date: nil, start_date: nil}

  def fixture(:transaction_set) do
    {:ok, transaction_set} = Aggregation.create_transaction_set(@create_attrs)
    transaction_set
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all transaction_sets", %{conn: conn} do
      conn = get(conn, Routes.transaction_set_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create transaction_set" do
    test "renders transaction_set when data is valid", %{conn: conn} do
      conn = post(conn, Routes.transaction_set_path(conn, :create), transaction_set: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.transaction_set_path(conn, :show, id))

      assert %{
               "id" => id,
               "end_date" => "2010-04-17",
               "start_date" => "2010-04-17"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.transaction_set_path(conn, :create), transaction_set: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update transaction_set" do
    setup [:create_transaction_set]

    test "renders transaction_set when data is valid", %{conn: conn, transaction_set: %TransactionSet{id: id} = transaction_set} do
      conn = put(conn, Routes.transaction_set_path(conn, :update, transaction_set), transaction_set: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.transaction_set_path(conn, :show, id))

      assert %{
               "id" => id,
               "end_date" => "2011-05-18",
               "start_date" => "2011-05-18"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, transaction_set: transaction_set} do
      conn = put(conn, Routes.transaction_set_path(conn, :update, transaction_set), transaction_set: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete transaction_set" do
    setup [:create_transaction_set]

    test "deletes chosen transaction_set", %{conn: conn, transaction_set: transaction_set} do
      conn = delete(conn, Routes.transaction_set_path(conn, :delete, transaction_set))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.transaction_set_path(conn, :show, transaction_set))
      end
    end
  end

  defp create_transaction_set(_) do
    transaction_set = fixture(:transaction_set)
    {:ok, transaction_set: transaction_set}
  end
end
