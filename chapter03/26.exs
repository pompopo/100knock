require Problem25
defmodule Problem26 do
  def solve do
    regexs = [~r/'''(.*)'''/, ~r/''(.*)''/, ~r/'(.*)'/]
    apply_regexs(Problem25.solve, regexs)
  end

  def apply_regexs(dict, regexs) do
    Dict.keys(dict) |> Enum.reduce(%{}, fn(key, acc) ->
                                          new_value = convert(regexs, Dict.get(dict, key))
                                          Dict.put(acc, key, new_value)
                                        end)
  end

  defp convert(regexs, str) do
    Enum.reduce(regexs, str, fn(regex, acc) -> Regex.replace(regex, acc, "\\1") end)
  end
end

IO.inspect Problem26.solve
