defmodule Cayenne.LPP.Payload do
  @moduledoc """
  This module is used to build a Cayenne LPP payload, which can be used to
  send it via a LoRa node to a LoRa Gateway

  ### Example

  ```elixir
  alias Cayenne.LPP.Payload
  alias Cayenne.LPP.Type.{Temperature, RelativeHumidity}

  payload =
    Payload.new()
    |> Payload.add(1, Temperature.new(28.3))
    |> Payload.add(2, RelativeHumidity.new(40.5))

  # Payload as String: "0167011B02680195"
  payload
  |> Payload.to_string()
  |> IO.inspect(label: "Payload as String")

  # Payload size (in bytes): 8
  payload
  |> Payload.size()
  |> IO.inspect(label: "Payload size (in bytes)")
  ```
  """

  alias Cayenne.LPP.{Buffer, Encoder}

  @type channel :: non_neg_integer()
  @type type :: struct()
  @type fragment :: {channel(), type()}

  @type t :: %__MODULE__{
          fragments: list(fragment())
        }

  defstruct fragments: []

  @spec new() :: t()
  def new, do: %__MODULE__{}

  @spec add(t(), channel(), type()) :: t()
  def add(%__MODULE__{} = payload, channel, %_{} = type),
    do: %{payload | fragments: payload.fragments ++ [{channel, type}]}

  @spec to_buffer(t()) :: Buffer.t()
  def to_buffer(%__MODULE__{fragments: fragments}) do
    Enum.reduce(fragments, Buffer.new(), fn {channel, type}, buffer ->
      buffer
      |> Buffer.add_byte(channel)
      |> Buffer.concat(Encoder.encode(type))
    end)
  end

  @spec to_string(t()) :: String.t()
  def to_string(%__MODULE__{} = payload) do
    payload
    |> to_buffer()
    |> Buffer.to_string()
  end

  @spec size(t()) :: Buffer.size()
  def size(%__MODULE__{} = payload) do
    payload
    |> to_buffer()
    |> Buffer.size()
  end
end
