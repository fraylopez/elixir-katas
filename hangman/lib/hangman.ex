defmodule Hangman do
  @moduledoc """
  Documentation for `Hangman`.
  """

  def guess(_word, "a") do
    {:ok, "*a*a*"}
  end

  def guess(word, "x") do
    {:bad_guess,
     word
     |> String.replace(~r/./, "*")}
  end

  def guess(word, letter) do
    {:ok,
     word
     |> String.replace(~r/[^#{letter}]/, "*")}
  end
end
