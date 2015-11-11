defmodule P do
  def shorten(name, index) do
    set = Enum.into([1, 5, 6, 7, 8, 9, 15, 16, 19], HashSet.new)
    if Set.member?(set, index) do
      String.slice(name, 0, 1)
    else
      String.slice(name, 0, 2)
    end
  end
end

s = "Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can."


IO.inspect s |> String.split([" ", ","], trim: true)
             |> Enum.with_index
             |> Enum.map(fn {name, index} -> {P.shorten(name, index + 1), index} end)
             |> Enum.reduce(HashDict.new, fn {name, index}, set -> HashDict.put(set, name, index + 1) end)
