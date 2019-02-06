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

  def render("enriched_transactions.json", %{transactions: transactions}) do
    %{data: render_many(transactions, TransactionView, "enriched_transaction.json")}
  end

  def render("enriched_transaction.json", %{transaction: transaction}) do
    %{
      amount: transaction.amount,
      transaction_date: transaction.transaction_date |> Date.to_string(),
      party: %{
        name: transaction.party.name,
        tags: transaction.party.tags |> Enum.map(fn x -> %{tag: x.tag} end)
      }
    }
  end
end
