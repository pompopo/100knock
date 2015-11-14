path = Path.dirname(__ENV__.file) <> "/uk.txt"
{ :ok, file } = File.read path

result = file |> (String.split "\n")
              |> (Enum.map &(Regex.named_captures ~r/^(?<level>=+)(?<name>[^=]+)=+$/, &1))
              |> (Enum.filter_map &is_map/1, fn(x) ->
                                               level = String.length(x["level"]) - 1
                                               name = x["name"]
                                               "#{level}\t#{name}"
                                             end)
              |> Enum.join "\n"
IO.puts result
