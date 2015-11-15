require Problem25
defmodule Problem26 do
  def solve do
    dict = Problem25.solve

    Dict.keys(dict) |> Enum.reduce(%{}, fn(key, acc) ->
                                         new_value = strip_markup(Dict.get(dict, key))
                                         Dict.put(acc, key, new_value)
                                       end)
  end

  defp strip_markup(str) do
    regexs = [~r/'''(.*)'''/, ~r/''(.*)''/, ~r/'(.*)'/]
    Enum.reduce(regexs, str, fn(regex, acc) -> Regex.replace(regex, acc, "\\1") end)
  end
end

IO.inspect Problem26.solve
