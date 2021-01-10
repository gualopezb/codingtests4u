# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :codingtests4u,
  ecto_repos: [Codingtests4u.Repo]

# Configures the endpoint
config :codingtests4u, Codingtests4uWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "y052Pz/I7z6OFlU30DR445BeCB0n4ervyKY/yx6zK0AMD59/DLg703A8pzN6axe1",
  render_errors: [view: Codingtests4uWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Codingtests4u.PubSub,
  live_view: [signing_salt: "Ljfv5ha6"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
