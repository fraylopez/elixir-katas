defmodule Snake do
  def move(
        %State{head: {x, y}, looking_towards: looking_towards},
        look_towards \\ nil
      ) do
    vector = direction_to_vector(look_towards || looking_towards)

    %{
      head: {x + elem(vector, 0), y + elem(vector, 1)},
      looking_towards: look_towards || looking_towards
    }
  end

  defp direction_to_vector(:up), do: {0, 1}
  defp direction_to_vector(:down), do: {0, -1}
  defp direction_to_vector(:left), do: {-1, 0}
  defp direction_to_vector(:right), do: {1, 0}
end
