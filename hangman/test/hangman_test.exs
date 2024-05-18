defmodule HangmanTest do
  use ExUnit.Case
  doctest Hangman

  test "should handle a good guess" do
    assert Hangman.guess("nadar", "a") == {:ok, "*a*a*"}
  end

  test "should handle a wrong guess" do
    assert Hangman.guess("nadar", "x") == {:bad_guess, "*****"}
  end

  test "should handle an invalid guess for a longer word" do
    assert Hangman.guess("ahogarse", "x") == {:bad_guess, "********"}
  end

  test "should handle another good guess" do
    assert Hangman.guess("nadar", "d") == {:ok, "**d**"}
  end
end
