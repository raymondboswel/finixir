defmodule FinixirWeb.TransactionTypeControllerTest do
  use FinixirWeb.ConnCase

  alias Finixir.Aggregation
  alias Finixir.Aggregation.TransactionType

  @create_attrs %{
    transaction_type: "some transaction_type"
  }
  @update_attrs %{
    transaction_type: "some updated transaction_type"
  }
  @invalid_attrs %{transaction_type: nil}

  def fixture(:transaction_type) do
    {:ok, transaction_type} = Aggregation.create_transaction_type(@create_attrs)
    transaction_type
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all transaction_types", %{conn: conn} do
      conn = get(conn, Routes.transaction_type_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create transaction_type" do
    test "renders transaction_type when data is valid", %{conn: conn} do
      conn = post(conn, Routes.transaction_type_path(conn, :create), transaction_type: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.transaction_type_path(conn, :show, id))

      assert %{
               "id" => id,
               "transaction_type" => "some transaction_type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.transaction_type_path(conn, :create), transaction_type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update transaction_type" do
    setup [:create_transaction_type]

    test "renders transaction_type when data is valid", %{conn: conn, transaction_type: %TransactionType{id: id} = transaction_type} do
      conn = put(conn, Routes.transaction_type_path(conn, :update, transaction_type), transaction_type: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.transaction_type_path(conn, :show, id))

      assert %{
               "id" => id,
               "transaction_type" => "some updated transaction_type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, transaction_type: transaction_type} do
      conn = put(conn, Routes.transaction_type_path(conn, :update, transaction_type), transaction_type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete transaction_type" do
    setup [:create_transaction_type]

    test "deletes chosen transaction_type", %{conn: conn, transaction_type: transaction_type} do
      conn = delete(conn, Routes.transaction_type_path(conn, :delete, transaction_type))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.transaction_type_path(conn, :show, transaction_type))
      end
    end
  end

  defp create_transaction_type(_) do
    transaction_type = fixture(:transaction_type)
    {:ok, transaction_type: transaction_type}
  end
end
