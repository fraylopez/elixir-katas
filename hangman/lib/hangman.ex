defmodule Hangman do
  @moduledoc """
  Documentation for `Hangman`.

  ## Examples
      iex> Hangman.guess("hello", "h")
      {:ok, "h****"}

  """

  import String

  def guess(
        %State{word: word, guessed: guessed} = state,
        letter
      ) do
    case guess(word, letter) do
      {:ok, updated_guessed} ->
        {
          :ok,
          %State{word: word, guessed: merge_guesses(guessed, updated_guessed)}
        }

      {:bad_guess, _} ->
        handle_bad_guess(state)
    end
  end

  defp handle_bad_guess(%State{limbs: limbs} = state) do
    case limbs do
      1 -> {:game_over, %State{state | limbs: 0}}
      _ -> {:bad_guess, %State{state | limbs: limbs - 1}}
    end
  end

  defp merge_guesses(guesses1, guesses2) do
    guesses1
    |> split("")
    |> Enum.zip(split(guesses2, ""))
    |> Enum.map(&keep_hidden/1)
    |> Enum.join()
  end

  defp keep_hidden({g1, g2}) do
    if g1 == "*", do: g2, else: g1
  end

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
