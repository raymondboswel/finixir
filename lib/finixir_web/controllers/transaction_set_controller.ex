defmodule FinixirWeb.TransactionSetController do
  use FinixirWeb, :controller

  alias Finixir.Aggregation
  alias Finixir.Aggregation.TransactionSet

  action_fallback FinixirWeb.FallbackController

  def index(conn, _params) do
    transaction_sets = Aggregation.list_transaction_sets()
    render(conn, "index.json", transaction_sets: transaction_sets)
  end

  def create(conn, %{"transaction_set" => transaction_set_params}) do
    with {:ok, %TransactionSet{} = transaction_set} <- Aggregation.create_transaction_set(transaction_set_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.transaction_set_path(conn, :show, transaction_set))
      |> render("show.json", transaction_set: transaction_set)
    end
  end

  def show(conn, %{"id" => id}) do
    transaction_set = Aggregation.get_transaction_set!(id)
    render(conn, "show.json", transaction_set: transaction_set)
  end

  def update(conn, %{"id" => id, "transaction_set" => transaction_set_params}) do
    transaction_set = Aggregation.get_transaction_set!(id)

    with {:ok, %TransactionSet{} = transaction_set} <- Aggregation.update_transaction_set(transaction_set, transaction_set_params) do
      render(conn, "show.json", transaction_set: transaction_set)
    end
  end

  def delete(conn, %{"id" => id}) do
    transaction_set = Aggregation.get_transaction_set!(id)

    with {:ok, %TransactionSet{}} <- Aggregation.delete_transaction_set(transaction_set) do
      send_resp(conn, :no_content, "")
    end
  end
end
