require Problem26
defmodule Problem27 do
  def solve do
    regexs = [ ~r/\[\[([^\|]+?)\]\]/, ~r/\[\[[^\|]+\|([^|]+?)\]\]/]
    Problem26.apply_regexs(Problem26.solve, regexs)
  end
end

dict = Problem27.solve
IO.puts Dict.keys(dict) |> Enum.map(&("#{&1} => #{Dict.get dict, &1}")) |> Enum.join "\n"
