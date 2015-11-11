{:ok, file} = File.read Path.dirname(__ENV__.file) <> "/hightemp.txt"

# ファイル最後の空行はwcではカウントされないので1だけ引く
IO.puts String.split(file, "\n") |> Enum.count - 1

File.close file
