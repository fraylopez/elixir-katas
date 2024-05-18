defmodule State do
  defstruct word: "",
            guessed: ""

  @typedoc "A person"
  @type t() :: %__MODULE__{
          word: String.t(),
          guessed: String.t()
        }
end
