defprotocol Cayenne.LPP.Encoder do
  @moduledoc """
  Cayenne LPP types need to implement this protocol to be encoded into
  a `Cayenne.LPP.Buffer`
  """

  @spec encode(t()) :: Cayenne.LPP.Buffer.t()
  def encode(type)
end
