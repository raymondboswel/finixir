defmodule Finixir.Aggregation.Transaction do
  use Ecto.Schema
  import Ecto.Changeset


  schema "transactions" do
    field :amount, :float
    field :transaction_date, :date
    field :transaction_type_id, :id

    timestamps()
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:transaction_date, :amount])
    |> validate_required([:transaction_date, :amount])
  end
end