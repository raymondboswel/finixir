defmodule Finixir.Aggregation.TransactionSet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transaction_sets" do
    field :end_date, :date
    field :start_date, :date
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(transaction_set, attrs) do
    transaction_set
    |> cast(attrs, [:start_date, :end_date, :title])
    |> validate_required([:start_date, :end_date, :title])
  end
end
