defmodule P do
  def cipher(text) do
    String.codepoints(text)
      |> Enum.map(fn c ->
                    if downcase_alphabet?(c) do
                      replace(c)
                    else
                      c
                    end
                  end)
      |> Enum.join
  end

  # "a" -> "z"
  def replace(str) do
    str |> String.to_char_list
        |> hd
        |> (&(219 - &1)).()
        |> (&([&1])).()
        |> to_string
  end

  def downcase_alphabet?(str) do
    str |> String.to_char_list
        |> hd
        |> (&(?a <= &1 and &1 <= ?z)).()
  end

end

s = P.cipher("abcxyzABCあいうえお123")
IO.inspect s
IO.inspect P.cipher(s)
