defmodule Yamlex.Mixfile do
  use Mix.Project

  def project do
    [app: :yamlex,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),

     description: "YAML parser: encode + decode",
     source_url: "https://github.com/timCF/yamlex",
     package: [
       licenses: ["Apache 2.0"],
       maintainers: ["Ilja Tkachuk aka timCF"],
       links: %{
         "GitHub" => "https://github.com/timCF/yamlex",
         "Author's home page" => "https://timcf.github.io/"
       }
     ],
     # Docs
     name: "Yamlex",
     docs: [main: "readme", extras: ["README.md"]],

   ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [
						:logger,
						:fast_yaml,
					],
     mod: {Yamlex, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
	defp deps do
		[
			{:fast_yaml, "~> 1.0.12"},
			{:p1_utils, "~> 1.0.10"},
			{:aspire, "~> 0.1.0"},
			{:ex_doc, "~> 0.16", only: :dev, runtime: false},
		]
	end
end
