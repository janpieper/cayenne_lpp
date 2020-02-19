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

## Inspiration

This library has been inspired by the following list of articles, videos and
libraries written in other programming languages:

* **Articles**
  * [OMA LightweightM2M (LwM2M) Object and Resource Registry](http://openmobilealliance.org/wp/OMNA/LwM2M/LwM2MRegistry.html)
  * [Cayenne Low Power Payload](https://developers.mydevices.com/cayenne/docs/lora/#lora-cayenne-low-power-payload)
  * [Cayenne LPP 2.0](https://community.mydevices.com/t/cayenne-lpp-2-0/7510/1)
  * [Cayenne LPP @ loranow.com](https://loranow.com/cayennelpp/)
* **Libraries**
  * https://github.com/myDevicesIoT/CayenneLPP (C++)
  * https://github.com/TheThingsNetwork/arduino-device-lib (C)
  * https://github.com/OlegZv/Python-CayenneLPP (Python)
  * https://github.com/ctron/cayenne-lpp (Java)
* **Videos**
  * [How to: Payload Functions](https://www.youtube.com/watch?v=nT2FnwCoP7w)
  * [Eric Ptak - Payload formats for LPWAN Applications](https://www.youtube.com/watch?v=UL5IDpGCKkU)
* **Platforms**
  * [Cayenne Cloud](https://developers.mydevices.com/) by [myDevices](https://mydevices.com/)
  * [TheThingsNetwork](https://www.thethingsnetwork.org/)

## TODOs

* [ ] Publish to [hex.pm](https://hex.pm/)
* [ ] Publish docs to [hexdocs.pm](https://hexdocs.pm/)
* [ ] Support decoding, not just encoding
* [ ] _TBD_

## License

This software is licensed unter [the MIT license](LICENSE.md)
