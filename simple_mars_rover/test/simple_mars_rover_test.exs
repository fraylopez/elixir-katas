defmodule SimpleMarsRoverTest do
  use ExUnit.Case
  doctest SimpleMarsRover

  test "greets the world" do
    assert SimpleMarsRover.hello() == :world
  end
end
