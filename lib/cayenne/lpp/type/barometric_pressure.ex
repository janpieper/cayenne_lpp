defmodule Cayenne.LPP.Type.BarometricPressure do
  @moduledoc """
  Cayenne LPP type for barometric pressure

  ### Example

  ```elixir
  alias Cayenne.LPP.{Buffer, Encoder}
  alias Cayenne.LPP.Type.BarometricPressure

  buffer =
    1017.8
    |> DigitalInput.new()
    |> Encoder.encode()

  Buffer.to_string(buffer) # "7327C2"
  Buffer.size(buffer) # 3
  ```
  """

  use Cayenne.LPP.Type,
    id: 0x73,
    size: 2,
    multiplier: 10
end
