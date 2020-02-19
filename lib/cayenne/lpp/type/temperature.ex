defmodule Cayenne.LPP.Type.Temperature do
  @moduledoc """
  Cayenne LPP type for temperature

  ### Example

  ```elixir
  alias Cayenne.LPP.{Buffer, Encoder}
  alias Cayenne.LPP.Type.Temperature

  buffer =
    28.3
    |> Temperature.new()
    |> Encoder.encode(temperature)

  Buffer.to_string(buffer) # "67011B"
  Buffer.size(buffer) # 3
  ```
  """

  use Cayenne.LPP.Type,
    id: 0x67,
    size: 2,
    multiplier: 10,
    signed: true
end
