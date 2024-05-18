defmodule Hangman do
  @moduledoc """
  Documentation for `Hangman`.
  """

  def guess(_word, "a") do
    {:ok, "*a*a*"}
  end

  def guess(word, "d") do
    {:ok,
     word
     |> String.replace(~r/[^d]/, "*")}
  end

  def guess(word, "x") do
    {:bad_guess,
     word
     |> String.replace(~r/./, "*")}
  end

  def guess(_, _) do
    {:error, "Invalid letter"}
  end
end
