defmodule Cayenne.LPP.Type.Accelerometer do
  @moduledoc "Cayenne LPP type for a 3-axis accelerometer"

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
    alias Cayenne.LPP.Type.Accelerometer

    @spec encode(Accelerometer.t()) :: Buffer.t()
    def encode(%Accelerometer{x: x, y: y, z: z}) do
      Buffer.new()
      |> Buffer.add_byte(0x71)
      |> Buffer.add_bytes(round(x * 1000), 2)
      |> Buffer.add_bytes(round(y * 1000), 2)
      |> Buffer.add_bytes(round(z * 1000), 2)
    end
  end
end
