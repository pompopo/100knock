x = "パタトクカシーー"
IO.inspect Stream.iterate(0, &(&1 + 2))
             |> Enum.take(4)
             |> Enum.reduce("", &(&2 <> String.at(x, &1)))
