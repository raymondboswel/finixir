defmodule FinixirWeb.TransactionTypeView do
  use FinixirWeb, :view
  alias FinixirWeb.TransactionTypeView

  def render("index.json", %{transaction_types: transaction_types}) do
    %{data: render_many(transaction_types, TransactionTypeView, "transaction_type.json")}
  end

  def render("show.json", %{transaction_type: transaction_type}) do
    %{data: render_one(transaction_type, TransactionTypeView, "transaction_type.json")}
  end

  def render("transaction_type.json", %{transaction_type: transaction_type}) do
    %{id: transaction_type.id,
      transaction_type: transaction_type.transaction_type}
  end
end
