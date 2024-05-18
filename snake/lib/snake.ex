defmodule Snake do
  def move(
        %State{head: {x, y}, looking_towards: looking_towards},
        look_towards \\ nil
      ) do
    look_towards = valid_turn?(looking_towards, look_towards || looking_towards)

    new_head =
      look_towards
      |> direction_to_vector()
      |> add({x, y})

    %{
      head: new_head,
      looking_towards: look_towards
    }
  end

  defp valid_turn?(looking_towards, look_towards) do
    case {looking_towards, look_towards} do
      {:up, :down} -> :up
      {:down, :up} -> :down
      {:left, :right} -> :left
      {:right, :left} -> :right
      _ -> look_towards
    end
  end

  defp direction_to_vector(:up), do: {0, 1}
  defp direction_to_vector(:down), do: {0, -1}
  defp direction_to_vector(:left), do: {-1, 0}
  defp direction_to_vector(:right), do: {1, 0}

  defp add({x1, y1}, {x2, y2}), do: {x1 + x2, y1 + y2}
end
