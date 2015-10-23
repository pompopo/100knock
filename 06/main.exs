defmodule P do
  def char_bigram(str) do
    ls = String.codepoints(str)
    Enum.zip(ls, tl(ls))
  end
end

s1 = "paraparaparadise"
s2 = "paragraph"

set1 = Enum.into(P.char_bigram(s1), HashSet.new)
set2 = Enum.into(P.char_bigram(s2), HashSet.new)
IO.write "union is "
IO.inspect HashSet.union(set1, set2)

IO.write "intersection is "
IO.inspect HashSet.intersection(set1, set2)

IO.write "X - Y is "
IO.inspect HashSet.difference(set1, set2)

IO.write "Y - X is "
IO.inspect HashSet.difference(set2, set1)

IO.write "X includes se: "
IO.inspect HashSet.member?(set1, {"s", "e"})

IO.write "Y includes se: "
IO.inspect HashSet.member?(set2, {"s", "e"})
