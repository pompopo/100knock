in_file_path = Path.dirname(__ENV__.file) <> "/hightemp.txt"
{ :ok, file } = File.read in_file_path

# 降順だと入力ファイルと同じなので、昇順でソート
IO.puts String.split(file, "\n", trim: true) |> (Enum.map &(String.split &1, "\t"))
                                             |> (Enum.sort fn([_, _, c1 | _], [_, _, c2, _]) -> c1 < c2 end)
                                             |> (Enum.map &(Enum.join &1, "\t"))
                                             |> Enum.join "\n"
