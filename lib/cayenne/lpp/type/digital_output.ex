defmodule Cayenne.LPP.Type.DigitalOutput do
  @moduledoc """
  Cayenne LPP type for digital output

  ### Example

  ```elixir
  alias Cayenne.LPP.{Buffer, Encoder}
  alias Cayenne.LPP.Type.DigitalOutput

  buffer =
    0
    |> DigitalOutput.new()
    |> Encoder.encode()

  Buffer.to_string(buffer) # "0100"
  Buffer.size(buffer) # 2
  ```
  """

  use Cayenne.LPP.Type,
    id: 0x01,
    size: 1
end
