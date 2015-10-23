defmodule P do
  :random.seed(:os.timestamp)

  def my_shuffle(text) do
    if String.length(text) <= 4 do
      text
    else
      start = String.at(text, 0)
      last = String.at(text, -1)
      body = String.slice(text, 1..-2)
               |> String.codepoints
               |> Enum.shuffle
               |> Enum.join
      start <> body <> last
    end
  end
end

s = "I couldn't believe that I could actually understand what I was reading : the phenomenal power of the human mind ."

IO.inspect String.split(s) |> Enum.map(&P.my_shuffle/1)
                           |> Enum.join(" ")
