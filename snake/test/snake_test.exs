defmodule SnakeTest do
  use ExUnit.Case
  doctest Snake

  test "sxcvcx" do
    assert Snake.move(%{head: {0, 0}}) ==
             %{head: {1, 0}}

    assert Snake.move(%{head: {1, 0}}) ==
             %{head: {2, 0}}

    assert Snake.move(%{head: {1, 1}}) ==
             %{head: {2, 1}}
  end

  test "sxcvcdsfdsx" do
    assert Snake.move_h(%{head: {1, 1}, looking_towards: :up}) ==
             %{
               head: {1, 2},
               looking_towards: :up
             }
  end
end
