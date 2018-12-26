defmodule FinixirWeb.PartyTagController do
  use FinixirWeb, :controller

  alias Finixir.Aggregation
  alias Finixir.Aggregation.PartyTag

  action_fallback FinixirWeb.FallbackController

  def process_csv(conn, %{"start_date" => start_date, "end_date" => end_date, "file" => file}) do
    Finixir.Aggregation.TransactionProcessor.process_transactions(start_date, end_date, file.path)
    # render(conn, "index.json", parties_tags: parties_tags)
  end
end
