use Mix.Config

config :twilixir,
  twilio_access_token_id: System.get_env("TWILIO_ACCESS_TOKEN_ID"),
  twilio_secret_key: System.get_env("TWILIO_SECRET_KEY")
