defmodule Finixir.Aggregation.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transactions" do
    field :amount, :float
    field :transaction_date, :date

    belongs_to(:transaction_type, Finixir.Aggregation.TransactionType)
    belongs_to(:transaction_set, Finixir.Aggregation.TransactionSet)
    belongs_to(:party, Finixir.Aggregation.Party)

    timestamps()
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [
      :transaction_date,
      :transaction_set_id,
      :transaction_type_id,
      :party_id,
      :amount
    ])
    |> validate_required([:transaction_date, :amount])
  end
end
