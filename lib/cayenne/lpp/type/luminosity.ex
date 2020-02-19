defmodule Cayenne.LPP.Type.Luminosity do
  @moduledoc """
  Cayenne LPP type for luminosity

  ### Example

  ```elixir
  alias Cayenne.LPP.{Buffer, Encoder}
  alias Cayenne.LPP.Type.Luminosity

  buffer =
    1055.63
    |> Gyrometer.new()
    |> Encoder.encode()

  Buffer.to_string(buffer) # "650420"
  Buffer.size(buffer) # 3
  ```
  """

  use Cayenne.LPP.Type,
    id: 0x65,
    size: 2
end
