defmodule Problem20 do
  def run(path) do
    { :ok, file } = File.read path
    result = String.split(file, "\n", trim: true)
               |> (Enum.map fn (line) ->
                              { :ok, data } = JSON.decode(line)
                              data
                            end)
               |> Enum.find &(&1["title"] == "イギリス")

    IO.puts result["text"]
  end
end

# path = Path.dirname(__ENV__.file) <> "/../../sample.json"
path = Path.dirname(__ENV__.file) <> "/../../jawiki-country.json"
Problem20.run(path)
