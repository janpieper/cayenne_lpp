defmodule Cayenne.LPP.Type.RelativeHumidity do
  @moduledoc """
  Cayenne LPP type for relative humidity

  ### Example

  ```elixir
  alias Cayenne.LPP.{Buffer, Encoder}
  alias Cayenne.LPP.Type.RelativeHumidity

  buffer =
    40.5
    |> RelativeHumidity.new()
    |> Encoder.encode(temperature)

  Buffer.to_string(buffer) # "680195"
  Buffer.size(buffer) # 3
  ```
  """

  use Cayenne.LPP.Type,
    id: 0x68,
    size: 2,
    multiplier: 10
end
