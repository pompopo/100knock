defmodule P do
  def message(x, y, z) do
    "#{x}時の#{y}は#{z}"
  end
end

IO.inspect P.message(12, "気温", 22.4)
