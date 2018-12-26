defmodule Finixir.CsvReader do
  def read_csv(file) do
    IO.puts("Reading csv")
    csv_stream = File.stream!(file) |> CSV.decode()
    # e = Stream.each(csv_stream, fn transaction -> IO.inspect(transaction) end)
    l =
      Enum.to_list(csv_stream)
      |> Enum.map(fn x -> elem(x, 1) end)
      |> Enum.filter(fn entry -> Enum.at(entry, 0) == "HIST" end)
      |> Enum.map(fn entry ->
        date = Timex.parse!(Enum.at(entry, 1), "{YYYY}{0M}{0D}")

        party =
          case Enum.at(entry, 5) do
            "" -> "Standard Bank Fees"
            party -> party
          end

        %CsvEntry{
          date: date,
          amount: Enum.at(entry, 3),
          transaction_type: Enum.at(entry, 4),
          party: party
        }
      end)
  end
end
