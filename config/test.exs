use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :finixir, FinixirWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :debug

# Configure your database
config :finixir, Finixir.Repo,
  username: "raymond",
  password: "password",
  database: "finixir_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
