defmodule Cayenne.LPP.Type.Gyrometer do
  @moduledoc """
  Cayenne LPP type for a 3-axis gyrometer

  ### Example

  ```elixir
  alias Cayenne.LPP.{Buffer, Encoder}
  alias Cayenne.LPP.Type.Gyrometer

  buffer =
    [x: 24.474, y: -1.104, z: -5.456]
    |> Gyrometer.new()
    |> Encoder.encode()

  Buffer.to_string(buffer) # "865F9AFBB0EAB0"
  Buffer.size(buffer) # 7
  ```
  """

  @type t :: %__MODULE__{
          x: number(),
          y: number(),
          z: number()
        }

  defstruct [:x, :y, :z]

  @spec new(x: number(), y: number(), z: number()) :: t()
  def new(x: x, y: y, z: z), do: %__MODULE__{x: x, y: y, z: z}

  defimpl Cayenne.LPP.Encoder, for: __MODULE__ do
    @moduledoc false

    alias Cayenne.LPP.Buffer
    alias Cayenne.LPP.Type.Gyrometer

    @spec encode(Gyrometer.t()) :: Buffer.t()
    def encode(%Gyrometer{x: x, y: y, z: z}) do
      Buffer.new()
      |> Buffer.add_byte(0x86)
      |> Buffer.add_bytes(round(x * 1000), 2)
      |> Buffer.add_bytes(round(y * 1000), 2)
      |> Buffer.add_bytes(round(z * 1000), 2)
    end
  end
end
