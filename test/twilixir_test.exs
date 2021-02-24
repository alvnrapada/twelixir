defmodule TwilixirTest do
  use ExUnit.Case
  doctest Twilixir

  setup do
    %{"sid" => sid} =
      Twilixir.create_conversation("Sample Create Conversation", %{status: "active"})

    %{
      sid: sid
    }
  end

  test "create_conversation/2" do
    assert %{
             "account_sid" => _,
             "attributes" => "{\"status\":\"active\"}",
             "chat_service_sid" => _,
             "date_created" => _,
             "date_updated" => _,
             "friendly_name" => "Sample Create Conversation",
             "links" => %{
               "messages" => _,
               "participants" => _,
               "webhooks" => _
             },
             "messaging_service_sid" => _,
             "sid" => _,
             "state" => "active",
             "timers" => _,
             "unique_name" => _,
             "url" => _
           } = Twilixir.create_conversation("Sample Create Conversation", %{status: "active"})
  end

  test "get_conversation/1", %{sid: sid} do
    assert %{
             "account_sid" => _,
             "attributes" => "{\"status\":\"active\"}",
             "chat_service_sid" => _,
             "date_created" => _,
             "date_updated" => _,
             "friendly_name" => "Sample Create Conversation",
             "links" => %{
               "messages" => _,
               "participants" => _,
               "webhooks" => _
             },
             "messaging_service_sid" => _,
             "sid" => _,
             "state" => "active",
             "timers" => _,
             "unique_name" => _,
             "url" => _
           } = Twilixir.get_conversation(sid)
  end

  test "get_multiple_conversations/2" do
    assert %{"conversations" => conversations} = Twilixir.get_multiple_conversations(1, 1)
    assert conversations |> Enum.count() == 1
  end
end
