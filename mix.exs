defmodule RustlerHmac.MixProject do
  use Mix.Project

  @version "0.0.1"

  def project do
    [
      app: :rustler_hmac,
      version: @version,
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler_precompiled, "~> 0.5"},
      {:rustler, ">= 0.0.0", optional: true}
    ]
  end
end
