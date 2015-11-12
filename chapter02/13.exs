col1_file_path = Path.dirname(__ENV__.file) <> "/col1.txt"
col2_file_path = Path.dirname(__ENV__.file) <> "/col2.txt"
out_file_path = Path.dirname(__ENV__.file) <> "/out.txt"

{ :ok, col1 } = File.read col1_file_path
{ :ok, col2 } = File.read col2_file_path

col1_lines = String.split col1, "\n"
col2_lines = String.split col2, "\n"
out_text = Enum.zip(col1_lines, col2_lines) |> (Enum.map (fn ({c1, c2}) -> "#{c1}\t#{c2}" end))
                                            |> Enum.join "\n"
File.write(out_file_path, out_text <> "\n")

File.close col1
File.close col2
