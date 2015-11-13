path = Path.dirname(__ENV__.file) <> "/uk.txt"
{ :ok, file } = File.read path

result = file |> (String.split "\n")
              |> (Enum.filter &(Regex.match? ~r/\[\[Category:.+\]\]/, &1))
              |> Enum.join "\n"
IO.puts result
