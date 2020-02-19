defmodule Cayenne.LPP.Type.Presence do
  @moduledoc """
  Cayenne LPP type for presence

  ### Example

  ```elixir
  alias Cayenne.LPP.{Buffer, Encoder}
  alias Cayenne.LPP.Type.Presence

  buffer =
    1
    |> Presence.new()
    |> Encoder.encode(temperature)

  Buffer.to_string(buffer) # "6601"
  Buffer.size(buffer) # 2
  ```
  """

  use Cayenne.LPP.Type,
    id: 0x66,
    size: 1
end
