defmodule FinixirWeb.TransactionSetController do
  use FinixirWeb, :controller

  alias Finixir.Aggregation
  alias Finixir.Aggregation.TransactionSet

  action_fallback FinixirWeb.FallbackController

  def index(conn, _params) do
    transaction_sets = Aggregation.list_transaction_sets()
    render(conn, "index.json", transaction_sets: transaction_sets)
  end

  def create(conn, transaction_params) do
    IO.inspect(transaction_params)
    IO.inspect(transaction_params["file"].path)

    if !File.exists?("/home/raymond/finixir") do
      res = File.mkdir("/home/raymond/finixir")
    end

    file_storage_path =
      "/home/raymond/finixir/" <>
        transaction_params["start_date"] <>
        "_" <> Integer.to_string(:os.system_time(:millisecond))

    res =
      File.copy(
        transaction_params["file"].path,
        file_storage_path
      )

    IO.inspect(res)

    Finixir.Aggregation.TransactionProcessor.process_transactions(
      transaction_params["start_date"],
      transaction_params["end_date"],
      file_storage_path
    )

    send_resp(conn, :ok, "")
    # render(conn, "agreement.json", agreement: agreement)

    # with {:ok, %Transaction{} = transaction} <- Aggregation.create_transaction(transaction_params) do
    #   conn
    #   |> put_status(:created)
    #   |> put_resp_header("location", Routes.transaction_path(conn, :show, transaction))
    #   |> render("show.json", transaction: transaction)
    # end
  end

  def show(conn, %{"id" => id}) do
    transaction_set = Aggregation.get_transaction_set!(id)
    render(conn, "show.json", transaction_set: transaction_set)
  end

  def update(conn, %{"id" => id, "transaction_set" => transaction_set_params}) do
    transaction_set = Aggregation.get_transaction_set!(id)

    with {:ok, %TransactionSet{} = transaction_set} <-
           Aggregation.update_transaction_set(transaction_set, transaction_set_params) do
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
