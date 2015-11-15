defmodule Problem25 do
  def solve do
    path = Path.dirname(__ENV__.file) <> "/uk.txt"
    { :ok, file } = File.read path

    # 基礎情報部分だけを抽出
    { _, lines} = file |> (String.split "\n")
                       |> (Enum.reduce { :out, [] }, fn (line, acc) ->
                                                  case acc do
                                                    { :out, _ } ->
                                                      if Regex.match? ~r/^{{基礎情報/, line do
                                                        { :in, [] }
                                                      else
                                                        acc
                                                      end
                                                    { :in, a } ->
                                                      if Regex.match? ~r/^}}/, line do
                                                        { :out, a }
                                                      else
                                                        { :in, [line|a] }
                                                      end
                                                  end
                                                end)
    { result, _ } = lines |> Enum.reverse
                          |> Enum.reduce({ %{}, "" }, fn (line, acc) ->
                                                        { dict, current_key } = acc
                                                        pair = Regex.named_captures ~r/^\|(?<title>.+) = (?<value>.+)/, line
                                                        { title, value } = if is_map pair do
                                                                             { pair["title"], pair["value"] }
                                                                           else
                                                                             { current_key, line }
                                                                           end
                                                        current_value = Dict.get dict, title, ""
                                                        new_dict = Dict.put dict, title, current_value <> value
                                                        { new_dict, title }
                                               end)
    result
  end
end
IO.inspect Problem25.solve
