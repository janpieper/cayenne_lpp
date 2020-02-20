defmodule Cayenne.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :cayenne_lpp,
      version: @version,
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      consolidate_protocols: Mix.env() != :test,
      deps: deps(),
      description: description(),
      package: package(),
      docs: docs(),
      test_coverage: [tool: ExCoveralls],
      prefered_cli_env: [
        coveralls: :test,
        "coveralls.html": :test
      ]
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:excoveralls, "~> 0.12.2", only: [:test]},
      {:credo, "~> 1.1.5", only: [:dev], runtime: false},
      {:dialyxir, "~> 1.0.0-rc.7", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.21.3", only: [:dev], runtime: false}
    ]
  end

  defp description do
    "cayenne_lpp is a library for working with Cayenne Low Power " <>
      "Payload (LPP) for LoRaWAN applications"
  end

  defp package do
    [
      maintainers: ["Jan Pieper"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/janpieper/cayenne_lpp"},
      files: ["lib", "mix.exs", "README.md", "LICENSE.md", ".formatter.exs"]
    ]
  end

  defp docs do
    [
      name: "cayenne_lpp",
      source_ref: "v#{@version}",
      canonical: "https://hexdocs.pm/cayenne_lpp",
      source_url: "https://github.com/janpieper/cayenne_lpp",
      extras: ["LICENSE.md"],
      groups_for_modules: [
        # Cayenne.LPP.Buffer
        # Cayenne.LPP.Encoder
        # Cayenne.LPP.Payload

        Types: [
          Cayenne.LPP.Type.Accelerometer,
          Cayenne.LPP.Type.AnalogInput,
          Cayenne.LPP.Type.AnalogOutput,
          Cayenne.LPP.Type.BarometricPressure,
          Cayenne.LPP.Type.DigitalInput,
          Cayenne.LPP.Type.DigitalOutput,
          Cayenne.LPP.Type.GPS,
          Cayenne.LPP.Type.Gyrometer,
          Cayenne.LPP.Type.Luminosity,
          Cayenne.LPP.Type.Presence,
          Cayenne.LPP.Type.RelativeHumidity,
          Cayenne.LPP.Type.Temperature
        ]
      ]
    ]
  end
end
