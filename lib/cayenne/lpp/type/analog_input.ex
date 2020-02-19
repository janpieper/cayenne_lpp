defmodule Cayenne.LPP.Type.AnalogInput do
  @moduledoc "Cayenne LPP type for analog input"

  use Cayenne.LPP.Type,
    id: 0x02,
    size: 2,
    multiplier: 100,
    signed: true
end
