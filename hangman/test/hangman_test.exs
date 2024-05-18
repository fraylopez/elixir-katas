defmodule HangmanTest do
  alias Logger.Backends.Handler
  use ExUnit.Case
  doctest Hangman

  test "should handle non first guess" do
    {:ok, %{guessed: guessed}} =
      Hangman.guess(
        %State{word: "nadar", guessed: "n****"},
        "d"
      )

    assert guessed == "n*d**"
  end

  test "should handle non first guess with a wrong guess" do
    {:bad_guess, %{guessed: guessed}} =
      Hangman.guess(
        %State{word: "nadar", guessed: "n****"},
        "x"
      )

    assert guessed == "n****"
  end

  test "should substract limbs on wrong guess" do
    {:bad_guess, %{limbs: limbs}} =
      Hangman.guess(
        %State{word: "nadar", guessed: "n****", limbs: 6},
        "x"
      )

    assert limbs == 5
  end

  test "should not substract limbs on good guess" do
    {:ok, %{limbs: limbs}} =
      Hangman.guess(
        %State{word: "nadar", guessed: "n****", limbs: 6},
        "d"
      )

    assert limbs == 6
  end

  test "should end the game on no turns left" do
    {:game_over, %{limbs: limbs}} =
      Hangman.guess(
        %State{word: "nadar", guessed: "*****", limbs: 1},
        "x"
      )

    assert limbs == 0
  end
end
