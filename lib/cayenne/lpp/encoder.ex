defprotocol Cayenne.LPP.Encoder do
  @spec encode(t()) :: Cayenne.LPP.Buffer.t()
  def encode(type)
end
