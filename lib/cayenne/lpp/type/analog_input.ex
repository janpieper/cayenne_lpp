defmodule Cayenne.LPP.Type.AnalogInput do
  @moduledoc """
  Cayenne LPP type for analog input

  ### Example

  ```elixir
  alias Cayenne.LPP.{Buffer, Encoder}
  alias Cayenne.LPP.Type.AnalogInput

  buffer =
    1.94
    |> AnalogInput.new()
    |> Encoder.encode(temperature)

  Buffer.to_string(buffer) # "0200C2"
  Buffer.size(buffer) # 3
  ```
  """

  use Cayenne.LPP.Type,
    id: 0x02,
    size: 2,
    multiplier: 100,
    signed: true
end
