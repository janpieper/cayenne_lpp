defmodule Cayenne.LPP.Type.RelativeHumidity do
  @moduledoc "Cayenne LPP type for relative humidity"

  use Cayenne.LPP.Type,
    id: 0x68,
    size: 2,
    multiplier: 10
end
