in_file_path = Path.dirname(__ENV__.file) <> "/hightemp.txt"
{ :ok, file } = File.read in_file_path
IO.puts file |> (String.split "\n", trim: true)
             |> (Enum.map (fn(line) -> hd(String.split(line, "\t")) end))
             |> Enum.sort
             |> (Enum.chunk_by &(&1))
             |> (Enum.map &({ hd(&1), Enum.count(&1) }))
             |> (Enum.sort_by &(elem(&1, 1)), &>=/2)
             |> (Enum.map &(elem(&1, 0)))
             |> Enum.join "\n"
