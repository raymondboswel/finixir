defmodule Finixir.Aggregation.TransactionType do
  use Ecto.Schema
  import Ecto.Changeset


  schema "transaction_types" do
    field :transaction_type, :string

    timestamps()
  end

  @doc false
  def changeset(transaction_type, attrs) do
    transaction_type
    |> cast(attrs, [:transaction_type])
    |> validate_required([:transaction_type])
  end
end
