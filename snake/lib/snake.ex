defmodule Snake do
  def move(%{head: {x, y}}) do
    %{head: {x + 1, y}}
  end

  def move_h(%{head: {x, y}, looking_towards: _looking_towards}) do
    %{head: {1, 2}, looking_towards: :up}
  end
end
