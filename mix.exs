defmodule TemplateProcessors.Mixfile do
  use Mix.Project

  def project do
    [app: :template_processors,
     version: "0.1.0",
     elixir: "~> 1.3",
     elixirc_options: [warnings_as_errors: System.get_env("ALLOW_WARNINGS") == nil],
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger,
                    :poison,
                    :table_rex]]
  end

  defp deps do
    [
      {:poison, "~> 2.0"},
      {:table_rex, "~> 0.8"},
      {:greenbar, github: "operable/greenbar"}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

end
