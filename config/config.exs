use Mix.Config

config :contraktor,
  ecto_repos: [Contraktor.Repo]

config :contraktor_web,
  ecto_repos: [Contraktor.Repo],
  generators: [context_app: :contraktor]

config :contraktor_web, ContraktorWeb.Endpoint,
  url: [port: 4000],
  secret_key_base: "auPyMGyW1C5Ch/4p2vy2bIA0Jwfz8mwFRBi0IJorlmT/KZl7KPvPrMsD7au3O0G+",
  render_errors: [view: ContraktorWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Contraktor.PubSub,
  live_view: [signing_salt: "pWGsCTIE"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
