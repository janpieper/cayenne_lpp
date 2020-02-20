defprotocol Cayenne.LPP.Encoder do
  @moduledoc """
  Cayenne LPP types need to implement this protocol to be encoded into
  a `Cayenne.LPP.Buffer`

  **Note:** Adding new types does not mean they will be automagically
  identified and/or supported by [TheThingsNetwork](https://thethingsnetwork.org/)
  and/or [Cayenne Cloud](https://developers.mydevices.com/)!
  """

  @spec encode(t()) :: Cayenne.LPP.Buffer.t()
  def encode(type)
end
