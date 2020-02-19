defmodule Cayenne.LPP.BufferTest do
  use ExUnit.Case, async: true

  alias Cayenne.LPP.Buffer

  test ".new" do
    assert Buffer.new() == %Buffer{}
  end

  test ".add_byte" do
    buffer = Buffer.new()

    assert Buffer.add_byte(buffer, 100) == %Buffer{data: <<0x64>>}
    assert Buffer.add_byte(buffer, -25) == %Buffer{data: <<0xE7>>}
    assert Buffer.add_byte(buffer, 1671) == %Buffer{data: <<0x87>>}
  end

  test ".add_bytes" do
    buffer = Buffer.new()

    assert Buffer.add_bytes(buffer, 100, 1) == %Buffer{data: <<0x64>>}
    assert Buffer.add_bytes(buffer, 1671, 1) == %Buffer{data: <<0x87>>}
    assert Buffer.add_bytes(buffer, 1671, 2) == %Buffer{data: <<0x06, 0x87>>}
    assert Buffer.add_bytes(buffer, 1671, 3) == %Buffer{data: <<0x00, 0x06, 0x87>>}
  end

  test ".concat" do
    buffer_a =
      Buffer.new()
      |> Buffer.add_byte(12)
      |> Buffer.add_byte(64)

    buffer_b =
      Buffer.new()
      |> Buffer.add_byte(28)
      |> Buffer.add_byte(3)

    assert Buffer.concat(Buffer.new(), Buffer.new()) == %Buffer{}

    assert Buffer.concat(buffer_a, buffer_a) == %Buffer{data: <<0x0C, 0x40, 0x0C, 0x40>>}
    assert Buffer.concat(buffer_a, buffer_b) == %Buffer{data: <<0x0C, 0x40, 0x1C, 0x03>>}

    assert Buffer.concat(buffer_b, buffer_a) == %Buffer{data: <<0x1C, 0x03, 0x0C, 0x40>>}
    assert Buffer.concat(buffer_b, buffer_b) == %Buffer{data: <<0x1C, 0x03, 0x1C, 0x03>>}
  end

  test ".to_string" do
    empty_buffer = Buffer.new()
    assert Buffer.to_string(empty_buffer) == ""

    buffer_with_two_bytes = Buffer.add_bytes(Buffer.new(), 1000, 2)
    assert Buffer.to_string(buffer_with_two_bytes) == "03E8"

    buffer_with_ten_bytes = Buffer.add_bytes(Buffer.new(), 0, 10)
    assert Buffer.to_string(buffer_with_ten_bytes) == "00000000000000000000"
  end

  test ".size" do
    empty_buffer = Buffer.new()
    assert Buffer.size(empty_buffer) == 0

    buffer_with_two_bytes = Buffer.add_bytes(Buffer.new(), 1000, 2)
    assert Buffer.size(buffer_with_two_bytes) == 2

    buffer_with_ten_bytes = Buffer.add_bytes(Buffer.new(), 0, 10)
    assert Buffer.size(buffer_with_ten_bytes) == 10
  end
end
