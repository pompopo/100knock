in_file_path = Path.dirname(__ENV__.file) <> "/hightemp.txt"
{ :ok, file } = File.read in_file_path
File.close file

{ count, _ } = Integer.parse(hd System.argv)

chunk = String.split(file, "\n", trim: true) |> (Enum.chunk count)
                                             |> (Enum.map fn(chunk) -> Enum.join chunk, "\n" end)
chunk |> Enum.with_index
      |> Enum.map fn({ data, index}) ->
                    IO.puts "---#{index}---"
                    IO.puts data
                  end
