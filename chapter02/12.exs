in_file_path = Path.dirname(__ENV__.file) <> "/hightemp.txt"
out1_file_path = Path.dirname(__ENV__.file) <> "/col1.txt"
out2_file_path = Path.dirname(__ENV__.file) <> "/col2.txt"
{:ok, in_file} = File.read in_file_path
File.close in_file

{ col1, col2 } = String.split(in_file, "\n", trim: true)
                       |> (Enum.map fn(x) ->
                         line = String.split x, "\t"
                         { hd(line), hd(tl(line)) }
                       end)
                       |> (Enum.reduce { [], [] }, fn ({ col1, col2 }, { acc1, acc2 }) ->
                         { [col1 | acc1] , [col2 | acc2] }
                       end)

File.write out1_file_path, ((Enum.reverse col1) |> Enum.join "\n")
File.write out2_file_path, ((Enum.reverse col2) |> Enum.join "\n")
