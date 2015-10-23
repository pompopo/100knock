s1 = "パトカー"
s2 = "タクシー"

IO.inspect Enum.zip(String.codepoints(s1), String.codepoints(s2))
             |> Enum.map(fn {x, y} -> x <> y end)
             |> Enum.join("")
