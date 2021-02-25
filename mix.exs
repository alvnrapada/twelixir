defmodule Twelixir.MixProject do
  use Mix.Project

  @project_url "https://github.com/alvnrapada/twelixir.git"

  def project do
    [
      app: :twelixir,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "Twelixir",
      source_url: @project_url,
      homepage_url: @project_url,
      description: "Twilio Conversation API Integration for Elixir",
      package: package(),
      docs: [
        main: "readme",
        extras: ["README.md"]
      ]
    ]
  end

  defp package do
    [
      maintainers: ["Alvin Rapada"],
      licenses: ["MIT"],
      links: %{"Github" => @project_url}
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
      {:ex_doc, "~> 0.18", only: :dev},
      {:httpoison, "~> 1.8"},
      {:jason, "~> 1.2"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
