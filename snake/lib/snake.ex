defmodule Snake do
  def move(
        %State{head: {x, y}, looking_towards: looking_towards},
        look_towards \\ nil
      ) do
    look_towards = correct_turn(looking_towards, look_towards || looking_towards)

    new_head =
      look_towards
      |> direction_to_vector()
      |> add({x, y})

    %{
      head: new_head,
      looking_towards: look_towards
    }
  end

  defp correct_turn(:up, :down), do: :up
  defp correct_turn(:down, :up), do: :down
  defp correct_turn(:left, :right), do: :left
  defp correct_turn(:right, :left), do: :right
  defp correct_turn(_, look_towards), do: look_towards

  defp direction_to_vector(:up), do: {0, 1}
  defp direction_to_vector(:down), do: {0, -1}
  defp direction_to_vector(:left), do: {-1, 0}
  defp direction_to_vector(:right), do: {1, 0}

  defp add({x1, y1}, {x2, y2}), do: {x1 + x2, y1 + y2}
end
