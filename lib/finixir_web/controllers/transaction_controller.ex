defmodule FinixirWeb.TransactionController do
  use FinixirWeb, :controller

  alias Finixir.Aggregation
  alias Finixir.Aggregation.Transaction

  action_fallback FinixirWeb.FallbackController

  def index(conn, _params) do
    transactions = Aggregation.list_transactions()
    render(conn, "index.json", transactions: transactions)
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
    transaction = Aggregation.get_transaction!(id)
    render(conn, "show.json", transaction: transaction)
  end

  def update(conn, %{"id" => id, "transaction" => transaction_params}) do
    transaction = Aggregation.get_transaction!(id)

    with {:ok, %Transaction{} = transaction} <-
           Aggregation.update_transaction(transaction, transaction_params) do
      render(conn, "show.json", transaction: transaction)
    end
  end

  def delete(conn, %{"id" => id}) do
    transaction = Aggregation.get_transaction!(id)

    with {:ok, %Transaction{}} <- Aggregation.delete_transaction(transaction) do
      send_resp(conn, :no_content, "")
    end
  end
end
