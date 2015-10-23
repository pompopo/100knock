s = "Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics."

IO.puts s |> String.split([" ", ",", "."], trim: true)
          |> Enum.map(&(String.length(&1)))
          |> Enum.join(",")
