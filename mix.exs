defmodule Cayenne.MixProject do
  use Mix.Project

  def project do
    [
      app: :cayenne_lpp,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
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
      {:dialyxir, "~> 1.0.0-rc.7", only: [:dev], runtime: false}
    ]
  end
end
