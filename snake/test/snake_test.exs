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
    %{head: head} = Snake.move_v(%{head: {1, 1}, looking_towards: :up})
    assert head == {1, 2}
    %{head: head} = Snake.move_v(%{head: {1, 1}, looking_towards: :down})
    assert head == {1, 0}
    %{head: head} = Snake.move_v(%{head: {1, 1}, looking_towards: :right})
    assert head == {2, 1}

    %{head: head} = Snake.move_v(%{head: {1, 1}, looking_towards: :left})
    assert head == {0, 1}
  end
end
