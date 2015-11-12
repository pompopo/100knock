in_file_path = Path.dirname(__ENV__.file) <> "/hightemp.txt"
{ :ok, file } = File.read in_file_path
IO.puts file |> (String.split "\n", trim: true)
             |> (Enum.map (fn(line) -> hd(String.split(line, "\t")) end))
             |> Enum.uniq
             |> Enum.join "\n"
