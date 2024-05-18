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
    for test_case <- [{:up, {1, 2}}, {:right, {2, 1}}, {:down, {1, 0}}, {:left, {0, 1}}] do
      look_towards = elem(test_case, 0)
      expected_head = elem(test_case, 1)

      %{head: head, looking_towards: looking_towards} =
        Snake.move(%State{head: {1, 1}}, look_towards)

      assert head == expected_head
      assert looking_towards == look_towards
    end
  end
end
