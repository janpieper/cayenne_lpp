defmodule Cayenne.LPP.Type.Temperature do
  @moduledoc "Cayenne LPP type for temperature"

  use Cayenne.LPP.Type,
    id: 0x67,
    size: 2,
    multiplier: 10,
    signed: true
end
