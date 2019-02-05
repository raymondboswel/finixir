defmodule FinixirWeb.TransactionSetView do
  use FinixirWeb, :view
  alias FinixirWeb.TransactionSetView

  def render("index.json", %{transaction_sets: transaction_sets}) do
    %{data: render_many(transaction_sets, TransactionSetView, "transaction_set.json")}
  end

  def render("show.json", %{transaction_set: transaction_set}) do
    %{data: render_one(transaction_set, TransactionSetView, "transaction_set.json")}
  end

  def render("transaction_set.json", %{transaction_set: transaction_set}) do
    %{
      id: transaction_set.id,
      start_date: transaction_set.start_date,
      end_date: transaction_set.end_date,
      title: transaction_set.title
    }
  end
end
