defmodule P do
  def bigram(ls) do
    Enum.zip(ls, tl(ls))
  end
end

s = "I am an NLPer"
IO.inspect P.bigram(String.split(s, "", trim: true))
IO.inspect P.bigram(String.split(s, " ", trim: true))
