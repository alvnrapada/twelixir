# Twelixir

Twilio Conversation API Integration for Elixir

## Installation

The package can be installed by adding `twelixir` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:twelixir, "~> 0.1.0"}
  ]
end
```

## Setup 

Go to your  `/config.exs` and setup twelixir config keys:

```elixir
config :twelixir,
  twilio_secret_key: "YOUR_TWILIO_SECRET_KEY",
  twilio_access_token_id: "YOUR_TWILIO_ACCESS_TOKEN_ID"
```

## Usage 

```elixir
defmodule YourAppModule do
  ...
  alias Twelixir

  Twelixir.create_conversation("Testing", %{type: "test"})
end
```

Documentation: [https://hexdocs.pm/twelixir](https://hexdocs.pm/twelixir/0.1.0/readme.html).

