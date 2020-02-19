defmodule Cayenne.LPP.Type.AnalogOutput do
  @moduledoc """
  Cayenne LPP type for analog output

  ### Example

  ```elixir
  alias Cayenne.LPP.{Buffer, Encoder}
  alias Cayenne.LPP.Type.AnalogOutput

  buffer =
    3.04
    |> AnalogOutput.new()
    |> Encoder.encode(temperature)

  Buffer.to_string(buffer) # "030130"
  Buffer.size(buffer) # 3
  ```
  """

  use Cayenne.LPP.Type,
    id: 0x03,
    size: 2,
    multiplier: 100,
    signed: true
end
