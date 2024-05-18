defmodule Snake do
  def move(%{head: {x, y}}) do
    %{head: {x + 1, y}}
  end

  def move_v(%{head: {x, y}, looking_towards: _looking_towards}) do
    vector =
      case _looking_towards do
        :up -> {0, 1}
        :down -> {0, -1}
        :left -> {-1, 0}
        :right -> {1, 0}
      end

    %{
      head: {x + elem(vector, 0), y + elem(vector, 1)},
      looking_towards: _looking_towards
    }
  end
end
