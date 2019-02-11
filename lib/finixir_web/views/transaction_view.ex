defmodule FinixirWeb.TransactionView do
  use FinixirWeb, :view
  alias FinixirWeb.TransactionView

  def render("index.json", %{transactions: transactions}) do
    %{data: render_many(transactions, TransactionView, "transaction.json")}
  end

  def render("show.json", %{transaction: transaction}) do
    %{data: render_one(transaction, TransactionView, "transaction.json")}
  end

  def render("transaction.json", %{transaction: transaction}) do
    %{
      id: transaction.id,
      transaction_date: transaction.transaction_date,
      amount: transaction.amount
    }
  end

  def render("transaction_set_transaction.json", %{transaction: transaction}) do
    %{
      id: transaction.id,
      amount: transaction.amount,
      transaction_date: transaction.transaction_date |> Date.to_string(),
      party: %{
        id: transaction.party.id,
        name: transaction.party.name,
        tags: transaction.party.tags |> Enum.map(fn t -> %{id: t.id, name: t.tag} end)
      }
    }
  end
end
