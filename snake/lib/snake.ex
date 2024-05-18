defmodule Snake do
  def move(%State{head: {x, y}, looking_towards: looking_towards}) do
    vector =
      case looking_towards do
        :up -> {0, 1}
        :down -> {0, -1}
        :left -> {-1, 0}
        :right -> {1, 0}
      end

    %{
      head: {x + elem(vector, 0), y + elem(vector, 1)},
      looking_towards: looking_towards
    }
  end
end
