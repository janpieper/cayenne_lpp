defmodule Cayenne.LPP.PayloadTest do
  use ExUnit.Case, async: true

  alias Cayenne.LPP.{Buffer, Payload}
  alias Cayenne.LPP.Type.{Temperature, RelativeHumidity}

  setup do
    temperature = Temperature.new(28.3)
    humidity = RelativeHumidity.new(40.5)

    empty_payload = Payload.new()
    payload_with_temperature = Payload.add(empty_payload, 1, temperature)
    payload_with_humidity = Payload.add(empty_payload, 1, humidity)

    payload_with_temperature_and_humidity =
      empty_payload
      |> Payload.add(1, temperature)
      |> Payload.add(2, humidity)

    %{
      temperature: temperature,
      humidity: humidity,
      empty_payload: empty_payload,
      payload_with_temperature: payload_with_temperature,
      payload_with_humidity: payload_with_humidity,
      payload_with_temperature_and_humidity: payload_with_temperature_and_humidity
    }
  end

  test ".new" do
    assert Payload.new() == %Payload{}
  end

  test ".add", ctx do
    payload_with_temperature = Payload.add(ctx.empty_payload, 1, ctx.temperature)
    assert payload_with_temperature == %Payload{fragments: [{1, ctx.temperature}]}

    payload_with_humidity = Payload.add(ctx.empty_payload, 1, ctx.humidity)
    assert payload_with_humidity == %Payload{fragments: [{1, ctx.humidity}]}

    payload_with_temperature_and_humidity =
      ctx.empty_payload
      |> Payload.add(1, ctx.temperature)
      |> Payload.add(2, ctx.humidity)

    assert payload_with_temperature_and_humidity ==
             %Payload{fragments: [{1, ctx.temperature}, {2, ctx.humidity}]}
  end

  test ".to_buffer", ctx do
    assert Payload.to_buffer(ctx.empty_payload) == %Buffer{}

    assert Payload.to_buffer(ctx.payload_with_temperature) ==
             %Buffer{data: <<0x01, 0x67, 0x01, 0x1B>>}

    assert Payload.to_buffer(ctx.payload_with_humidity) ==
             %Buffer{data: <<0x01, 0x68, 0x01, 0x95>>}

    assert Payload.to_buffer(ctx.payload_with_temperature_and_humidity) ==
             %Buffer{data: <<0x01, 0x67, 0x01, 0x1B, 0x02, 0x68, 0x01, 0x95>>}
  end

  test ".to_string", ctx do
    assert Payload.to_string(ctx.empty_payload) == ""
    assert Payload.to_string(ctx.payload_with_temperature) == "0167011B"
    assert Payload.to_string(ctx.payload_with_humidity) == "01680195"
    assert Payload.to_string(ctx.payload_with_temperature_and_humidity) == "0167011B02680195"
  end

  test ".size", ctx do
    assert Payload.size(ctx.empty_payload) == 0
    assert Payload.size(ctx.payload_with_temperature) == 4
    assert Payload.size(ctx.payload_with_humidity) == 4
    assert Payload.size(ctx.payload_with_temperature_and_humidity) == 8
  end
end
