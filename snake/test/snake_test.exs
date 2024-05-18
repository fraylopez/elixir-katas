defmodule SnakeTest do
  use ExUnit.Case
  doctest Snake

  test "move with no input" do
    %{head: head} = Snake.move(%State{head: {1, 1}, looking_towards: :up})
    assert head == {1, 2}
    %{head: head} = Snake.move(%State{head: {1, 1}, looking_towards: :down})
    assert head == {1, 0}
    %{head: head} = Snake.move(%State{head: {1, 1}, looking_towards: :right})
    assert head == {2, 1}
    %{head: head} = Snake.move(%State{head: {1, 1}, looking_towards: :left})
    assert head == {0, 1}
  end

  test "move towards look_towards" do
    %{head: head, looking_towards: looking_towards} =
      Snake.move(%State{head: {1, 1}, looking_towards: :right}, :up)

    assert head == {1, 2}
    assert looking_towards == :up
  end

  test "snake cannot turn 180" do
    %{head: head, looking_towards: looking_towards} =
      Snake.move(%State{head: {1, 1}, looking_towards: :up}, :down)

    assert head == {1, 2}
    assert looking_towards == :up
  end
end
