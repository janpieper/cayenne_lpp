defmodule Cayenne.LPP.Buffer do
  @moduledoc """
  This buffer module stores the data for `Cayenne.LPP.Payload` or any
  Cayenne LPP type

  ### Example

  ```elixir
  alias Cayenne.LPP.Buffer

  buffer =
    Buffer.new()
    |> Buffer.add_byte(0x28)
    |> Buffer.add_bytes(0xFF, 2)
    |> Buffer.add_bytes(0x1234, 2)

  Buffer.to_string(buffer) # "2800FF1234"
  Buffer.size(buffer) # 5
  ```
  """

  require Bitwise

  @type value :: number()
  @type size :: pos_integer()

  @type t :: %__MODULE__{
          data: binary()
        }

  defstruct data: <<>>

  @spec new() :: t()
  def new, do: %__MODULE__{}

  @spec add_byte(t(), value()) :: t()
  def add_byte(%__MODULE__{} = buffer, value),
    do: add_bytes(buffer, value, 1)

  @spec add_bytes(t(), value(), size()) :: t()
  def add_bytes(%__MODULE__{} = buffer, value, size)
      when is_integer(value) and is_integer(size) and size > 0 do
    Enum.reduce((size - 1)..0, buffer, fn index, buffer ->
      byte =
        value
        |> Bitwise.>>>(index * 8)
        |> Bitwise.&&&(0xFF)

      %{buffer | data: buffer.data <> <<byte>>}
    end)
  end

  @spec concat(t(), t()) :: t()
  def concat(%__MODULE__{} = a, %__MODULE__{} = b),
    do: %__MODULE__{data: a.data <> b.data}

  @spec to_string(t()) :: String.t()
  def to_string(%__MODULE__{data: data}) do
    for <<byte::8 <- data>>, into: "" do
      byte
      |> Integer.to_string(16)
      |> String.pad_leading(2, "0")
    end
  end

  @spec size(t()) :: non_neg_integer()
  def size(%__MODULE__{data: data}), do: byte_size(data)
end
