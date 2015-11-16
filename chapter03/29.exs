require Problem28

defmodule Problem29 do
  def solve do
    dict = Problem28.solve
    name = Dict.get dict, "国旗画像"
    url = "http://ja.wikipedia.org/w/api.php?action=query&prop=imageinfo&format=json&iiprop=url&titles=File:#{name}"
    encoded_url = URI.encode(url)

    # ここから先は雑
    :inets.start
    :ssl.start
    { :ok, data } = :httpc.request(:get, { to_char_list(encoded_url), [] }, [], [])
    { _, _, body }  = data

    results = Regex.named_captures ~r/"url":"(?<url>[^"]*)"/, to_string(body)
    results["url"]
  end
end

IO.puts Problem29.solve
