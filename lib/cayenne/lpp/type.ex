defmodule Cayenne.LPP.Type do
  @moduledoc false

  defmacro __using__(opts) do
    quote do
      @type t :: %__MODULE__{value: number()}

      defstruct [:value]

      @spec new(number()) :: t()
      def new(value), do: %__MODULE__{value: value}

      defimpl Cayenne.LPP.Encoder, for: __MODULE__ do
        @moduledoc false

        alias Cayenne.LPP.Buffer

        @spec encode(struct()) :: Buffer.t()
        def encode(%_{value: value}) do
          multiplier = unquote(opts)[:multiplier] || 1
          value = round(value * multiplier)

          Buffer.new()
          |> Buffer.add_byte(unquote(opts)[:id])
          |> Buffer.add_bytes(value, unquote(opts)[:size])
        end
      end
    end
  end
end
