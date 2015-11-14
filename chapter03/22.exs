path = Path.dirname(__ENV__.file) <> "/uk.txt"
{ :ok, file } = File.read path

result = file |> (String.split "\n")
              |> (Enum.map &(Regex.named_captures ~r/\[\[Category:(?<name>.+)\]\]/, &1))
              |> (Enum.filter_map &is_map/1, &(&1["name"]))
              |> Enum.join "\n"
IO.puts result
