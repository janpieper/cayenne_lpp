defmodule Cayenne.LPP.Type.DigitalInput do
  @moduledoc """
  Cayenne LPP type for digital input

  ### Example

  ```elixir
  alias Cayenne.LPP.{Buffer, Encoder}
  alias Cayenne.LPP.Type.DigitalInput

  buffer =
    1
    |> DigitalInput.new()
    |> Encoder.encode()

  Buffer.to_string(buffer) # "0001"
  Buffer.size(buffer) # 2
  ```
  """

  use Cayenne.LPP.Type,
    id: 0x00,
    size: 1
end
