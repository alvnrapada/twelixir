defmodule Twelixir do
  @moduledoc """
  Twilio Conversation API Integration for Elixir.
  For more information please visit  [Twilio Conversations Documentation](https://www.twilio.com/docs/conversations/quickstart)
  """

  @base_twilio_url "https://conversations.twilio.com/v1/Conversations/"
  @doc """
  Creates a new conversation

  Parameters
  - friendly_name: string
  - attrs: map (you can put any field you want for you own needs)

  ## Examples

      iex> Twelixir.create_conversation("Alvin - Sample", %{status: "active"})
      %{
        "account_sid" => "AXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "attributes" => "{\"status\":\"active\"}",
        "chat_service_sid" => "CXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "date_created" => "2021-02-24T02:04:36Z",
        "date_updated" => "2021-02-24T02:04:36Z",
        "friendly_name" => "Alvin - Sample",
        "links" => %{
          "messages" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages",
          "participants" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants",
          "webhooks" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Webhooks"
        },
        "messaging_service_sid" => "MXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "sid" => "CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "state" => "active",
        "timers" => %{},
        "unique_name" => nil,
        "url" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
      }

  """
  def create_conversation(friendly_name, attrs) do
    api_url = "#{@base_twilio_url}"

    body = %{
      FriendlyName: friendly_name,
      Attributes: attrs |> Jason.encode!()
    }

    api_post_request(api_url, body)
  end

  @doc """
  Gets a conversation

  Parameters
  - conversation_sid: coversation's sid

  ## Examples 

      iex> Twelixir.get_conversation("SIDXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
      %{
        "account_sid" => "AXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "attributes" => "{\"status\":\"active\"}",
        "chat_service_sid" => "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "date_created" => "2021-02-24T02:04:36Z",
        "date_updated" => "2021-02-24T02:04:36Z",
        "friendly_name" => "Alvin - Sample",
        "links" => %{
          "messages" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages",
          "participants" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants",
          "webhooks" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Webhooks"
        },
        "messaging_service_sid" => "MXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "sid" => "SIDXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "state" => "active",
        "timers" => %{},
        "unique_name" => nil,
        "url" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
      }

  """
  def get_conversation(conversation_sid) do
    api_url = "#{@base_twilio_url}#{conversation_sid}"

    api_get_request(api_url)
  end

  @doc """
  Gets multiple conversations (with pagination)

  Parameters
  - page: current page
  - page_size: conversation size per page

  ## Examples
    
      iex> Twelixir.get_multiple_conversations(1, 2)
      %{
        "conversations" => [
          %{
            "account_sid" => "AXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "attributes" => "{\"status\":\"active\"}",
            "chat_service_sid" => "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "date_created" => "2021-02-24T02:04:36Z",
            "date_updated" => "2021-02-24T02:04:36Z",
            "friendly_name" => "Alvin - Sample",
            "links" => %{
              "messages" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages",
              "participants" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants",
              "webhooks" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Webhooks"
            },
            "messaging_service_sid" => "MXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "sid" => "CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "state" => "active",
            "timers" => %{},
            "unique_name" => nil,
            "url" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
          },
          ...
        ],
        "meta" => %{
          "first_page_url" => "https://conversations.twilio.com/v1/Conversations?PageSize=2&Page=0",
          "key" => "conversations",
          "next_page_url" => "https://conversations.twilio.com/v1/Conversations?PageSize=2&Page=2&PageToken=PXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
          "page" => 1,
          "page_size" => 2,
          "previous_page_url" => nil,
          "url" => "https://conversations.twilio.com/v1/Conversations?PageSize=2&Page=1"
        }
      }

  """
  def get_multiple_conversations(page \\ 1, page_size \\ 50) do
    api_url = "#{@base_twilio_url}?Page=#{page}&PageSize=#{page_size}"

    api_get_request(api_url)
  end

  @doc """
  Gets all conversations

  ## Examples

      iex> Twelixir.get_all_conversations()
      %{
        "conversations" => [
          %{
            "account_sid" => "AXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "attributes" => "{\"status\":\"active\"}",
            "chat_service_sid" => "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "date_created" => "2021-02-24T02:04:36Z",
            "date_updated" => "2021-02-24T02:04:36Z",
            "friendly_name" => "Alvin - Sample",
            "links" => %{
              "messages" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages",
              "participants" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants",
              "webhooks" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Webhooks"
            },
            "messaging_service_sid" => "MXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "sid" => "CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "state" => "active",
            "timers" => %{},
            "unique_name" => nil,
            "url" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
          },
          ...
        ],
        "meta" => %{
          "first_page_url" => "https://conversations.twilio.com/v1/Conversations?PageSize=PageSize&Page=0",
          "key" => "conversations",
          "next_page_url" => "https://conversations.twilio.com/v1/Conversations?PageSize=PageSize&Page=1&PageToken=PXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
          "page" => 0,
          "page_size" => page_size,
          "previous_page_url" => nil,
          "url" => "https://conversations.twilio.com/v1/Conversations?PageSize=PageSize&Page=0"
        }
      }

  """
  def get_all_conversations do
    api_url = "#{@base_twilio_url}"

    api_get_request(api_url)
  end

  @doc """
  Updates a conversation

  Parameters
  - conversation_sid: coversation's sid
  - new attrs: map (you can put any field you want for you own needs)
  - state: conversation state (active inactive close), note that once you close a conversation you can't re-activate it.

  ## Examples

      iex> Twelixir.update_conversation("CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", %{status: "inactive"}, "inactive")
      %{
        "account_sid" => "AXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "attributes" => "{\"status\":\"inactive\"}",
        "chat_service_sid" => "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "date_created" => "2021-02-24T02:04:36Z",
        "date_updated" => "2021-02-24T02:36:34Z",
        "friendly_name" => "Alvin - Sample",
        "links" => %{
          "messages" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages",
          "participants" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants",
          "webhooks" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Webhooks"
        },
        "messaging_service_sid" => "MXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "sid" => "CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "state" => "inactive",
        "timers" => %{},
        "unique_name" => nil,
        "url" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
      }

  """
  def update_conversation(conversation_sid, new_attrs, state) do
    api_url = "#{@base_twilio_url}#{conversation_sid}"

    body = %{
      State: state,
      Attributes: new_attrs |> Jason.encode!()
    }

    api_post_request(api_url, body)
  end

  @doc """
  Deletes a conversation

  Parameters
  - conversation_sid: coversation's sid

  ## Examples

      iex> Twelixir.delete_conversation("CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
      :ok

  """
  def delete_conversation(conversation_sid) do
    api_url = "#{@base_twilio_url}#{conversation_sid}"
    api_delete_request(api_url)
  end

  def create_participant_sms(
        conversation_sid,
        phone_number,
        country_code,
        twilio_proxy_mobile,
        attrs
      ) do
    api_url = "#{@base_twilio_url}#{conversation_sid}/Participants"

    participant_mobile = validate_mobile(phone_number, country_code)

    body = %{
      "MessagingBinding.Address": participant_mobile,
      "MessagingBinding.ProxyAddress": twilio_proxy_mobile,
      Attributes: attrs |> Jason.encode!()
    }

    api_post_request(api_url, body)
  end

  @doc """
  Creates a participant on a conversation

  Parameters
  - conversation_sid: coversation's sid
  - indentity: unique participant identity (can be user.id) 
  - attrs: map (you can put any field you want for you own needs)

  ## Examples

      iex> Twelixir.create_participant_chat("CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", "AlvinIdentity", %{type: "web"})
      %{
        "account_sid" => "AXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "attributes" => "{\"type\":\"web\"}",
        "conversation_sid" => "CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "date_created" => "2021-02-25T07:46:00Z",
        "date_updated" => "2021-02-25T07:46:00Z",
        "identity" => "AlvinIdentity",
        "last_read_message_index" => nil,
        "last_read_timestamp" => nil,
        "messaging_binding" => nil,
        "role_sid" => "RLXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "sid" => "MXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "url" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants/MXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
      }

  """
  def create_participant_chat(conversation_sid, indentity, attrs) do
    api_url = "#{@base_twilio_url}#{conversation_sid}/Participants"

    body = %{
      Attributes: attrs |> Jason.encode!(),
      Identity: indentity
    }

    api_post_request(api_url, body)
  end

  @doc """
  Gets a specific participant

  Parameters
  - conversation_sid: coversation's sid
  - participant_sid: coversation's sid

  ## Examples

      iex> Twelixir.get_participant("CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", "MXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
      %{
        "account_sid" => "AXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "attributes" => "{\"type\":\"web\"}",
        "conversation_sid" => "CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "date_created" => "2021-02-25T07:46:00Z",
        "date_updated" => "2021-02-25T07:46:00Z",
        "identity" => "AlvinIdentity",
        "last_read_message_index" => nil,
        "last_read_timestamp" => nil,
        "messaging_binding" => nil,
        "role_sid" => "RXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "sid" => "MXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "url" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants/MXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
      }

  """
  def get_participant(conversation_sid, participant_sid) do
    api_url = "#{@base_twilio_url}#{conversation_sid}/Participants/#{participant_sid}"

    api_get_request(api_url)
  end

  @doc """
  Gets multiple participants (with pagination)

  Parameters
  - conversation_sid: coversation's sid
  - page: current page
  - page_size: participants size per page

  ## Examples
    
      iex> Twelixir.get_multiple_participants("CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", 0, 2)
      %{
        "meta" => %{
          "first_page_url" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants?PageSize=1&Page=0",
          "key" => "participants",
          "next_page_url" => nil,
          "page" => 0,
          "page_size" => 1,
          "previous_page_url" => nil,
          "url" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants?PageSize=1&Page=0"
        },
        "participants" => [
          %{
            "account_sid" => "AXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "attributes" => "{\"type\":\"web\"}",
            "conversation_sid" => "CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "date_created" => "2021-02-25T07:46:00Z",
            "date_updated" => "2021-02-25T07:46:00Z",
            "identity" => "AlvinIdentity",
            "last_read_message_index" => nil,
            "last_read_timestamp" => nil,
            "messaging_binding" => nil,
            "role_sid" => "RXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "sid" => "MXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "url" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants/MXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
          },
          ...
        ]
      }

  """
  def get_multiple_participants(conversation_sid, page \\ 0, page_size \\ 50) do
    api_url =
      "#{@base_twilio_url}#{conversation_sid}/Participants?Page=#{page}&PageSize=#{page_size}"

    api_get_request(api_url)
  end

  @doc """
  Gets all participants

  Parameters
  - conversation_sid: coversation's sid

  ## Examples
    
      iex> Twelixir.get_all_participants("CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
      %{
        "meta" => %{
          "first_page_url" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants?PageSize=50&Page=0",
          "key" => "participants",
          "next_page_url" => nil,
          "page" => 0,
          "page_size" => 50,
          "previous_page_url" => nil,
          "url" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants?PageSize=50&Page=0"
        },
        "participants" => [
          %{
            "account_sid" => "AXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "attributes" => "{\"type\":\"web\"}",
            "conversation_sid" => "CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "date_created" => "2021-02-25T07:46:00Z",
            "date_updated" => "2021-02-25T07:46:00Z",
            "identity" => "AlvinIdentity",
            "last_read_message_index" => nil,
            "last_read_timestamp" => nil,
            "messaging_binding" => nil,
            "role_sid" => "RXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "sid" => "MXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "url" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants/MXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
          },
          ...
        ]
      }

  """
  def get_all_participants(conversation_sid) do
    api_url = "#{@base_twilio_url}#{conversation_sid}/Participants"

    api_get_request(api_url)
  end

  @doc """
  Update participant 

  Parameters
  - conversation_sid: coversation's sid
  - participant_sid: participant's sid
  - attrs: map (you can put any field you want for you own needs)

  ## Examples
    
      iex> Twelixir.update_participant("CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", "MXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", %{type: "WhatsApp"})
      %{
        "account_sid" => "AXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "attributes" => "{\"type\":\"WhatsApp\"}",
        "conversation_sid" => "CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "date_created" => "2021-02-25T07:46:00Z",
        "date_updated" => "2021-02-25T08:07:35Z",
        "identity" => "AlvinIdentity",
        "last_read_message_index" => nil,
        "last_read_timestamp" => nil,
        "messaging_binding" => nil,
        "role_sid" => "RXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "sid" => "MXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "url" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants/MXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
      }

  """
  def update_participant(conversation_sid, participant_sid, attrs) do
    api_url = "#{@base_twilio_url}#{conversation_sid}/Participants/#{participant_sid}"

    body = %{
      Attributes: attrs |> Jason.encode!()
    }

    api_post_request(api_url, body)
  end

  @doc """
  Delete participant 

  Parameters
  - conversation_sid: coversation's sid
  - participant_sid: participant's sid

  ## Examples
    
      iex> Twelixir.deletej_participant("CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", "MXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
      :ok

  """
  def delete_participant(conversation_sid, participant_sid) do
    api_url = "#{@base_twilio_url}#{conversation_sid}/Participants/#{participant_sid}"
    api_delete_request(api_url)
  end

  @doc """
  Creates a message 

  Parameters
  - conversation_sid: coversation's sid
  - author: message author (:string)
  - message_body: the actual message
  - attrs: map (you can put any field you want for you own needs) - In my case this is where I monitor the message's read and unread state.

  ## Examples
    
      iex> Twelixir.create_message("CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", "Sample Author", "Hi?", %{status: "unread"})
      %{
        "account_sid" => "AXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "attributes" => "{\"status\":\"unread\"}",
        "author" => "Sample Author",
        "body" => "Hi?",
        "conversation_sid" => "CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "date_created" => "2021-02-25T10:28:38Z",
        "date_updated" => "2021-02-25T10:28:38Z",
        "delivery" => nil,
        "index" => 0,
        "links" => %{
          "delivery_receipts" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/IXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Receipts"
        },
        "media" => nil,
        "participant_sid" => nil,
        "sid" => "IXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "url" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/IXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
      }

  """
  def create_message(conversation_sid, author, message_body, attrs) do
    api_url = "#{@base_twilio_url}#{conversation_sid}/Messages"

    body = %{
      Author: author,
      Attributes: attrs |> Jason.encode!(),
      Body: message_body
    }

    api_post_request(api_url, body)
  end

  @doc """
  Gets a message 

  Parameters
  - conversation_sid: coversation's sid
  - message_sid: message's sid

  ## Examples
    
      iex> Twelixir.get_message("CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", "IXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
      %{
        "account_sid" => "AXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "attributes" => "{\"status\":\"unread\"}",
        "author" => "Sample Author",
        "body" => "Hi?",
        "conversation_sid" => "CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "date_created" => "2021-02-25T10:28:38Z",
        "date_updated" => "2021-02-25T10:28:38Z",
        "delivery" => nil,
        "index" => 0,
        "links" => %{
          "delivery_receipts" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/IXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Receipts"
        },
        "media" => nil,
        "participant_sid" => nil,
        "sid" => "IXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "url" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/IXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
      }

  """
  def get_message(conversation_sid, message_sid) do
    api_url = "#{@base_twilio_url}#{conversation_sid}/Messages/#{message_sid}"

    api_get_request(api_url)
  end

  @doc """
  Gets multiple messages (with pagination)

  Parameters
  - conversation_sid: coversation's sid
  - page: current page
  - page_size: messages size per page

  ## Examples
    
      iex> Twelixir.get_multiple_messages("CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", 0, 2)
      %{
        "messages" => [
          %{
            "account_sid" => "AXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "attributes" => "{\"status\":\"unread\"}",
            "author" => "Sample Author",
            "body" => "Hi?",
            "conversation_sid" => "CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "date_created" => "2021-02-25T10:28:38Z",
            "date_updated" => "2021-02-25T10:28:38Z",
            "delivery" => nil,
            "index" => 0,
            "links" => %{
              "delivery_receipts" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/IXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Receipts"
            },
            "media" => nil,
            "participant_sid" => nil,
            "sid" => "IXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "url" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/IXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
          },
          ...
        ],
        "meta" => %{
          "first_page_url" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages?%3FPage=0&PageSize=2&Page=0",
          "key" => "messages",
          "next_page_url" => nil,
          "page" => 0,
          "page_size" => 2,
          "previous_page_url" => nil,
          "url" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages?%3FPage=0&PageSize=2&Page=0"
        }
      }

  """
  def get_multiple_messages(conversation_sid, page \\ 0, page_size \\ 50) do
    api_url = "#{@base_twilio_url}#{conversation_sid}/Messages?Page=#{page}&PageSize=#{page_size}"

    api_get_request(api_url)
  end

  @doc """
  Gets all messages

  Parameters
  - conversation_sid: coversation's sid

  ## Examples
    
      iex> Twelixir.get_all_messages("CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
      %{
        "messages" => [
          %{
            "account_sid" => "AXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "attributes" => "{\"status\":\"unread\"}",
            "author" => "Sample Author",
            "body" => "Hi?",
            "conversation_sid" => "CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "date_created" => "2021-02-25T10:28:38Z",
            "date_updated" => "2021-02-25T10:28:38Z",
            "delivery" => nil,
            "index" => 0,
            "links" => %{
              "delivery_receipts" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/IXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Receipts"
            },
            "media" => nil,
            "participant_sid" => nil,
            "sid" => "IXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "url" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/IXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
          },
          ...
        ],
        "meta" => %{
          "first_page_url" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages?PageSize=50&Page=0",
          "key" => "messages",
          "next_page_url" => nil,
          "page" => 0,
          "page_size" => 50,
          "previous_page_url" => nil,
          "url" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages?PageSize=50&Page=0"
        }
      }

  """
  def get_all_messages(conversation_sid) do
    api_url = "#{@base_twilio_url}#{conversation_sid}/Messages"

    api_get_request(api_url)
  end

  @doc """
  Updates a message

  Parameters
  - conversation_sid: coversation's sid
  - message_sid: message's sid
  - message_body: the actual message
  - attrs: map (you can put any field you want for you own needs) - In my case this is where I monitor the message's read and unread state.

  ## Examples
    
      iex> Twelixir.update_message("CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", "IXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", "Hello", %{status: "read"})
      %{
        "account_sid" => "AXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "attributes" => "{\"status\":\"read\"}",
        "author" => "Sample Author",
        "body" => "Hello",
        "conversation_sid" => "CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "date_created" => "2021-02-25T10:28:38Z",
        "date_updated" => "2021-02-25T10:46:05Z",
        "delivery" => nil,
        "index" => 0,
        "links" => %{
          "delivery_receipts" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/IXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Receipts"
        },
        "media" => nil,
        "participant_sid" => nil,
        "sid" => "IXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "url" => "https://conversations.twilio.com/v1/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/IXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
      }

  """
  def update_message(conversation_sid, message_sid, message_body, attrs) do
    api_url = "#{@base_twilio_url}#{conversation_sid}/Messages/#{message_sid}"

    body = %{
      Attributes: attrs |> Jason.encode!(),
      Body: message_body
    }

    api_post_request(api_url, body)
  end

  @doc """
  Deletes a message

  Parameters
  - conversation_sid: coversation's sid
  - message_sid: message's sid

  ## Examples
    
      iex> Twelixir.delete_message("CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", "IXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
      :ok

  """
  def delete_message(conversation_sid, message_sid) do
    api_url = "#{@base_twilio_url}#{conversation_sid}/Messages/#{message_sid}"
    api_delete_request(api_url)
  end

  defp get_twilio_auth() do
    twilio_access_token_id = Application.get_env(:twelixir, :twilio_access_token_id)
    twilio_secret_key = Application.get_env(:twelixir, :twilio_secret_key)

    [basic_auth: {twilio_access_token_id, twilio_secret_key}]
  end

  # Utility Functions

  defp api_get_request(api_url) do
    with auth <- get_twilio_auth(),
         {:ok, api_response} <- HTTPoison.get(api_url, [], hackney: auth) do
      api_response
      |> Map.fetch!(:body)
      |> Jason.decode!()
    else
      {:error, error} ->
        {:error, error}

      _ ->
        {:error, :invalid_request}
    end
  end

  defp api_post_request(api_url, body) do
    with headers <- ["content-type": "application/x-www-form-urlencoded"],
         auth <- get_twilio_auth(),
         encoded_body <- URI.encode_query(body),
         {:ok, api_response} <- HTTPoison.post(api_url, encoded_body, headers, hackney: auth) do
      api_response
      |> Map.fetch!(:body)
      |> Jason.decode!()
    else
      {:error, error} ->
        {:error, error}

      _ ->
        {:error, :invalid_request}
    end
  end

  defp api_delete_request(api_url) do
    with auth <- get_twilio_auth(),
         {_, api_response} <- HTTPoison.delete(api_url, [], hackney: auth) do
      case api_response.status_code do
        204 -> IO.puts("Successfully deleted.")
        _ -> IO.puts("Failed to delete, status code: #{api_response.status_code}")
      end
    end
  end

  @doc """
  Validates a phone number

  ## NOTES:
   - Assumes the phone number is a US number unless told otherwise
   - Use two letter country codes - https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements
   - You can look up the phone carrier info with '?Type=carrier'; BUT IT COSTS EXTRA
   - You can attempt to lookup up the persons information with '?Type=caller-name'; BUT IT COSTS EXTRA
  """
  def validate_mobile(phone_number, country_code) do
    api_url =
      "https://lookups.twilio.com/v1/PhoneNumbers/#{phone_number}?CountryCode=#{country_code}"

    api_response = api_get_request(api_url)

    case api_response["phone_number"] do
      nil -> false
      _ -> api_response["phone_number"]
    end
  end
end
