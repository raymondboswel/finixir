defmodule Finixir.Aggregation.TransactionProcessor do
  alias Finixir.Aggregation

  def process_transactions(transaction_set_title, start_date, end_date, file) do
    csv_entries = Finixir.CsvReader.read_csv(file)

    {:ok, transaction_set} =
      Aggregation.create_transaction_set(%{
        title: transaction_set_title,
        start_date: start_date,
        end_date: end_date
      })

    csv_entries
    |> Enum.each(fn csv_entry ->
      IO.inspect(csv_entry)

      party =
        case Aggregation.find_party(csv_entry.party) do
          nil ->
            {:ok, party} = Aggregation.create_party(%{name: csv_entry.party})
            party

          party ->
            party
        end

      IO.inspect(party)

      transaction_type =
        case Aggregation.find_transaction_type(csv_entry.transaction_type) do
          nil ->
            {:ok, transaction_type} =
              Aggregation.create_transaction_type(%{transaction_type: csv_entry.transaction_type})

            transaction_type

          transaction_type ->
            transaction_type
        end

      transaction =
        Aggregation.create_transaction(%{
          amount: csv_entry.amount,
          transaction_date: csv_entry.date,
          transaction_type_id: transaction_type.id,
          transaction_set_id: transaction_set.id,
          party_id: party.id
        })

      IO.inspect(transaction)
    end)

    #  TODO: Wrap in ecto.multi
    # Multi.new()
    # |> Multi.run(:create_tr_set, fn x -> Aggregation.create_transaction_set(%{start_date: start_date, end_date: end_date}) end)
    # |> Multi.run(:create_tr_set, fn {:ok, ts} ->

    # end)
    # |> Repo.transaction()
  end
end
