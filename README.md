# Twelixir

[Twilio Conversations API](https://www.twilio.com/docs/conversations/quickstart) Integration for Elixir

## Installation

The package can be installed by adding `twelixir` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:twelixir, "~> 0.1.0"}
  ]
end
```

## Prerequisite 

```elixir
def deps do
  [
    {:httpoison, "~> 1.8"},
    {:jason, "~> 1.2"}
  ]
end
```

## Setup 

Go to your  `/config.exs` and setup twelixir config keys:

```elixir
config :twelixir,
  twilio_access_token_id: "YOUR_TWILIO_ACCESS_TOKEN_ID",
  twilio_secret_key: "YOUR_TWILIO_SECRET_KEY"
```

## Usage 

```elixir
defmodule YourAppModule do
  ...
  alias Twelixir

  def your_method(your_friendly_name, your_attrs) do
    response = Twelixir.create_conversation(your_friendly_name, your_attrs)
    
    # response = %{
    # "account_sid" => "AXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
    # "attributes" => your_attrs,
    # "chat_service_sid" => "IXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
    # "date_created" => "2021-02-25T09:01:41Z",
    # "date_updated" => "2021-02-25T09:01:41Z",
    # "friendly_name" => your_friendly_name,
    # "links" => %{
    #   "messages" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages",
    #  "participants" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants",
    #   "webhooks" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Webhooks"
    # },
    # "messaging_service_sid" => "MXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
    # "sid" => "CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
    # "state" => "active",
    # "timers" => %{},
    # "unique_name" => nil,
    # "url" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    # }
  end
end
```

Documentation: [https://hexdocs.pm/twelixir](https://hexdocs.pm/twelixir/0.1.0/readme.html).

