defmodule Cayenne.LPP.EncodingTest do
  use ExUnit.Case, async: true

  alias Cayenne.LPP.{
    Buffer,
    Encoder
  }

  alias Cayenne.LPP.Type.{
    Accelerometer,
    AnalogInput,
    AnalogOutput,
    BarometricPressure,
    DigitalInput,
    DigitalOutput,
    GPS,
    Gyrometer,
    Luminosity,
    Presence,
    RelativeHumidity,
    Temperature
  }

  test "accelerometer" do
    type = Accelerometer.new(x: 0.131789, y: 0.122113, z: 0.937282)

    buffer = Encoder.encode(type)

    assert Buffer.size(buffer) == 7
    assert Buffer.to_string(buffer) == "710084007A03A9"
  end

  test "analog input" do
    analog_input = AnalogInput.new(1.94)

    buffer = Encoder.encode(analog_input)

    assert Buffer.size(buffer) == 3
    assert Buffer.to_string(buffer) == "0200C2"
  end

  test "analog output" do
    analog_output = AnalogOutput.new(3.04)

    buffer = Encoder.encode(analog_output)

    assert Buffer.size(buffer) == 3
    assert Buffer.to_string(buffer) == "030130"
  end

  test "barometric pressure" do
    pressure = BarometricPressure.new(1017.8)

    buffer = Encoder.encode(pressure)

    assert Buffer.size(buffer) == 3
    assert Buffer.to_string(buffer) == "7327C2"
  end

  test "digital input" do
    digital_input = DigitalInput.new(1)

    buffer = Encoder.encode(digital_input)

    assert Buffer.size(buffer) == 2
    assert Buffer.to_string(buffer) == "0001"
  end

  test "digital output" do
    digital_output = DigitalOutput.new(1)

    buffer = Encoder.encode(digital_output)

    assert Buffer.size(buffer) == 2
    assert Buffer.to_string(buffer) == "0101"
  end

  test "gps" do
    gps = GPS.new(lat: 50.9294, lon: 6.9617, alt: 49)

    buffer = Encoder.encode(gps)

    assert Buffer.size(buffer) == 10
    assert Buffer.to_string(buffer) == "8807C56E010FF1001324"
  end

  test "gyrometer" do
    gyrometer = Gyrometer.new(x: 24.474, y: -1.104, z: -5.456)

    buffer = Encoder.encode(gyrometer)

    assert Buffer.size(buffer) == 7
    assert Buffer.to_string(buffer) == "865F9AFBB0EAB0"
  end

  test "luminosity" do
    luminosity = Luminosity.new(1055.63)

    buffer = Encoder.encode(luminosity)

    assert Buffer.size(buffer) == 3
    assert Buffer.to_string(buffer) == "650420"
  end

  test "presence" do
    presence = Presence.new(1)

    buffer = Encoder.encode(presence)

    assert Buffer.size(buffer) == 2
    assert Buffer.to_string(buffer) == "6601"
  end

  test "relative humidity" do
    humidity = RelativeHumidity.new(40.5)

    buffer = Encoder.encode(humidity)

    assert Buffer.size(buffer) == 3
    assert Buffer.to_string(buffer) == "680195"
  end

  test "temperature" do
    temperature = Temperature.new(28.3)

    buffer = Encoder.encode(temperature)

    assert Buffer.size(buffer) == 3
    assert Buffer.to_string(buffer) == "67011B"
  end
end
