require Problem26
require Problem27

defmodule Problem28 do
  def solve do
    dict = Problem27.solve
    # 面倒臭いから「イギリス」の項目に含まれているものだけ
    regexs = [
      ~r/\[\[ファイル:[^|]+\|[^|]+\|(.+?)\]\]/,
      ~r/{{[^|]+\|[^|]+\|(.+?)}}/,
      ~r/\[http[^\s]+ (.+)\]/
    ]
    Problem26.apply_regexs(dict, regexs)
  end
end

dict = Problem28.solve
IO.puts Dict.keys(dict) |> Enum.map(&("#{&1} => #{Dict.get dict, &1}")) |> Enum.join "\n"
