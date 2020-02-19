defmodule Cayenne.LPP.Type.AnalogOutput do
  @moduledoc "Cayenne LPP type for analog output"

  use Cayenne.LPP.Type,
    id: 0x03,
    size: 2,
    multiplier: 100,
    signed: true
end
