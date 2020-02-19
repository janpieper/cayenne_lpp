defmodule Cayenne.LPP.Type.BarometricPressure do
  @moduledoc "Cayenne LPP type for barometric pressure"

  use Cayenne.LPP.Type,
    id: 0x73,
    size: 2,
    multiplier: 10
end
