in_file_path = Path.dirname(__ENV__.file) <> "/hightemp.txt"
{ :ok, file } = File.read in_file_path

{count, _} = Integer.parse(hd System.argv)

IO.puts String.split(file, "\n") |> (Enum.take count)
                                 |> Enum.join "\n"
File.close file
