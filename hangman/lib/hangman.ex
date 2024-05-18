defmodule Hangman do
  @moduledoc """
  Documentation for `Hangman`.

  ## Examples
      iex> Hangman.guess("hello", "h")
      {:ok, "h****"}

  """

  import String

  def guess(word, letter) do
    word
    |> contains?(letter)
    |> case do
      true -> good_guess(word, letter)
      false -> bad_guess(word, letter)
    end
  end

  defp bad_guess(word, _letter) do
    {:bad_guess,
     word
     |> replace(~r/./, "*")}
  end

  defp good_guess(word, letter) do
    {:ok,
     word
     |> replace(~r/[^#{letter}]/, "*")}
  end
end
