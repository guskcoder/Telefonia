defmodule Telefonia.MixProject do
  use Mix.Project

  def project do
    [
      app: :telefonia,
      version: "0.1.0",
      elixir: "~> 1.12",
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
      {:ex_doc, "~> 0.19.3", only: :dev},
      {:earmark, "~> 1.4", only: :dev}
    ]
  end
end
