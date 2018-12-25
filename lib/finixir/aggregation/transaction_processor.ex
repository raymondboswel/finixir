defmodule Finixir.Aggregation.TransactionProcessor do
  alias Finixir.Aggregation

  def process_transactions(start_date, end_date, file) do
    csv_entries = Finixir.CsvReader.read_csv(file)
    Aggregation.create_transaction_set(%{start_date: start_date, end_date: end_date})
  end
end
