# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ecto_embed_insert_bug,
  ecto_repos: [EctoEmbedInsertBug.Repo]

# Configures the endpoint
config :ecto_embed_insert_bug, EctoEmbedInsertBug.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VbO4eKnh8HIvNr0sZyExMa7dqk84khAwIWo037HFXCp14OJI5aRfN0OALRRVH0+c",
  render_errors: [view: EctoEmbedInsertBug.ErrorView, accepts: ~w(html json)],
  pubsub: [name: EctoEmbedInsertBug.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
