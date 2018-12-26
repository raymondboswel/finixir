defmodule Finixir.TransactionProcessorTest do
  use ExUnit.Case, async: true

  test "Stores all transactions from csv into database" do
    Finixir.Aggregation.TransactionProcessor.process_transactions(
      Date.utc_today(),
      Date.utc_today(), ""
    )
  end
end
