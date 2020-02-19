defmodule Cayenne.LPP.Type.GPS do
  @moduledoc "Cayenne LPP type for GPS"

  @type t :: %__MODULE__{
          lat: number(),
          lon: number(),
          alt: number()
        }

  defstruct [:lat, :lon, :alt]

  @spec new(lat: number(), lon: number(), alt: number()) :: t()
  def new(lat: lat, lon: lon, alt: alt),
    do: %__MODULE__{lat: lat, lon: lon, alt: alt}

  defimpl Cayenne.LPP.Encoder, for: __MODULE__ do
    @moduledoc false

    alias Cayenne.LPP.Buffer
    alias Cayenne.LPP.Type.GPS

    @spec encode(GPS.t()) :: Cayenne.LPP.Buffer.t()
    def encode(%GPS{lat: lat, lon: lon, alt: alt}) do
      Buffer.new()
      |> Buffer.add_byte(0x88)
      |> Buffer.add_bytes(round(lat * 10_000), 3)
      |> Buffer.add_bytes(round(lon * 10_000), 3)
      |> Buffer.add_bytes(round(alt * 100), 3)
    end
  end
end
