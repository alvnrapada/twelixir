use Mix.Config

config :twilixir,
  twilio_access_token_id:
    System.get_env("TWILIO_ACCESS_TOKEN_ID") || "SK5838ab85c63e197b5e5c3a95d4950238",
  twilio_secret_key: System.get_env("TWILIO_SECRET_KEY") || "ilrJMRSOxxYhFlUyX4b49Rhs16qgANCP"
