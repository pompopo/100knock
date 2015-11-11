{:ok, file} = File.read Path.dirname(__ENV__.file) <> "/hightemp.txt"

IO.puts String.replace(file, "\t", " ")

File.close file
