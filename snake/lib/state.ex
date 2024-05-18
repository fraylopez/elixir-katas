defmodule State do
  @type t :: %{
          head: {integer, integer},
          looking_towards: :up | :down | :left | :right
        }

  defstruct head: {0, 0},
            looking_towards: :up
end
