defmodule State do
  defstruct word: "",
            guessed: "",
            limbs: 6

  @typedoc "A person"
  @type t() :: %__MODULE__{
          word: String.t(),
          guessed: String.t(),
          limbs: non_neg_integer()
        }
end
