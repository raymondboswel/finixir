defmodule Finixir.CsvReader do
  def read_csv() do
    IO.puts("Reading csv")
    csv_stream = File.stream!("statement-41-123-148-0.csv") |> CSV.decode()
    # e = Stream.each(csv_stream, fn transaction -> IO.inspect(transaction) end)
    l =
      Enum.to_list(csv_stream)
      |> Enum.map(fn x -> elem(x, 1) end)
      |> Enum.filter(fn entry -> Enum.at(entry, 0) == "HIST" end)
      |> Enum.map(fn entry ->
        date = Timex.parse!(Enum.at(entry, 1), "{YYYY}{0M}{0D}")

        %CsvEntry{
          date: date,
          amount: Enum.at(entry, 3),
          transaction_type: Enum.at(entry, 4),
          party: Enum.at(entry, 5)
        }
      end)

    IO.inspect(l)
    IO.puts("Finished reading csv")
  end
end
