import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.

IO.puts "=========> #{System.get_env("GITHUB_ACTIONS")}"


config :jobs, Jobs.Repo,
  username: "postgres",
  password: "postgres",
  # hostname: System.get_env("DB_HOST") || "localhost",
  hostname: "localhost",

  database: "jobs_test#{System.get_env("MIX_TEST_PARTITION")}",
  # port: System.get_env("DATABASE_PORT") |> String.to_integer || 5433,
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

if System.get_env("GITHUB_ACTIONS") do
  config :jobs, Jobs.Repo,
    username: "postgres",
    password: "postgres",
    hostname: "localhost",
    database: "jobs_test"
end



# We don't run a server during test. If one is required,
# you can enable the server option below.
config :jobs, JobsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "9FMgN0YHKci1AF1tVuqSO2rfj/kn2GF9KBinSw343j1WwMhBYVH5bxs+Su8N7DzO",
  server: false

# In test we don't send emails.
config :jobs, Jobs.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
