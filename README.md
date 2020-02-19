# cayenne_lpp

Elixir library for Cayenne Low Power Payload (LPP) format

## Installation

The package can be installated by adding `cayenne_lpp` to your list of
dependencies in `mix.exs`:

```elixir
defp deps do
  [{:cayenne_lpp, "~> 0.1.0"}]
end
```

## Usage

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

## License

This software is licensed unter [the MIT license](LICENSE.md)
