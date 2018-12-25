defmodule FinixirWeb.TransactionTypeController do
  use FinixirWeb, :controller

  alias Finixir.Aggregation
  alias Finixir.Aggregation.TransactionType

  action_fallback FinixirWeb.FallbackController

  def index(conn, _params) do
    transaction_types = Aggregation.list_transaction_types()
    render(conn, "index.json", transaction_types: transaction_types)
  end

  def create(conn, %{"transaction_type" => transaction_type_params}) do
    with {:ok, %TransactionType{} = transaction_type} <- Aggregation.create_transaction_type(transaction_type_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.transaction_type_path(conn, :show, transaction_type))
      |> render("show.json", transaction_type: transaction_type)
    end
  end

  def show(conn, %{"id" => id}) do
    transaction_type = Aggregation.get_transaction_type!(id)
    render(conn, "show.json", transaction_type: transaction_type)
  end

  def update(conn, %{"id" => id, "transaction_type" => transaction_type_params}) do
    transaction_type = Aggregation.get_transaction_type!(id)

    with {:ok, %TransactionType{} = transaction_type} <- Aggregation.update_transaction_type(transaction_type, transaction_type_params) do
      render(conn, "show.json", transaction_type: transaction_type)
    end
  end

  def delete(conn, %{"id" => id}) do
    transaction_type = Aggregation.get_transaction_type!(id)

    with {:ok, %TransactionType{}} <- Aggregation.delete_transaction_type(transaction_type) do
      send_resp(conn, :no_content, "")
    end
  end
end
