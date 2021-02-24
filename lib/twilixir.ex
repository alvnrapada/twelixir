defmodule Twilixir do
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

      iex> Twilixir.create_conversation("Alvin - Sample", %{status: "active"})
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

  ## Valid Param

      iex> Twilixir.get_conversation("SIDXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
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

  ## Invalid Param

      iex> Twilixir.get_conversation("INVALID_XXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
      %{
        "code" => 20404,
        "message" => "The requested resource /Conversations/INVALID_XXXXXXXXXXXXXXXXXXXXXXXXXXXXX was not found",
        "more_info" => "https://www.twilio.com/docs/errors/20404",
        "status" => 404
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
  - page_size: Conversation Size Per Page

  ## Examples
    
      iex> Twilixir.get_multiple_conversations(1, 2)
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

      iex> Twilixir.get_all_conversations()
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

      iex> Twilixir.update_conversation("CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", %{status: "inactive"}, "inactive")
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

      iex> Twilixir.delete_conversation("CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
      Success - Deleted
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

  def create_participant_chat(conversation_sid, indentity, attrs) do
    api_url = "#{@base_twilio_url}#{conversation_sid}/Participants"

    body = %{
      Attributes: attrs |> Jason.encode!(),
      Identity: indentity
    }

    api_post_request(api_url, body)
  end

  def get_participant(conversation_sid, participant_id) do
    api_url = "#{@base_twilio_url}#{conversation_sid}/Participants/#{participant_id}"

    api_get_request(api_url)
  end

  def get_multiple_participants(conversation_sid, page_size \\ 50) do
    api_url = "#{@base_twilio_url}#{conversation_sid}/Participants?PageSize=#{page_size}"

    api_get_request(api_url)
  end

  def update_participant(conversation_sid, participant_id, attrs) do
    api_url = "#{@base_twilio_url}#{conversation_sid}/Participants/#{participant_id}"

    body = %{
      Attributes: attrs |> Jason.encode!()
    }

    api_post_request(api_url, body)
  end

  def delete_participant(conversation_sid, participant_id) do
    api_url = "#{@base_twilio_url}#{conversation_sid}/Participants/#{participant_id}"
    api_delete_request(api_url)
  end

  def create_message(conversation_sid, author, message_body, attrs) do
    api_url = "#{@base_twilio_url}#{conversation_sid}/Messages"

    body = %{
      Author: author,
      Attributes: attrs |> Jason.encode!(),
      Body: message_body
    }

    api_post_request(api_url, body)
  end

  def get_message(conversation_sid, message_id) do
    api_url = "#{@base_twilio_url}#{conversation_sid}/Messages/#{message_id}"

    api_get_request(api_url)
  end

  def get_multiple_messages(conversation_sid, page_size \\ 50) do
    api_url = "#{@base_twilio_url}#{conversation_sid}/Messages?PageSize=#{page_size}"

    api_get_request(api_url)
  end

  def update_message(conversation_sid, message_id, message_body, attrs) do
    api_url = "#{@base_twilio_url}#{conversation_sid}/Messages/#{message_id}"

    body = %{
      Attributes: attrs |> Jason.encode!(),
      Body: message_body
    }

    api_post_request(api_url, body)
    |> Map.fetch!(:body)
    |> Jason.decode!()
  end

  def delete_message(conversation_sid, message_id) do
    api_url = "#{@base_twilio_url}#{conversation_sid}/Messages/#{message_id}"
    api_delete_request(api_url)
  end

  defp get_twilio_auth() do
    twilio_access_token_id = "SK5838ab85c63e197b5e5c3a95d4950238"
    twilio_secret_key = "ilrJMRSOxxYhFlUyX4b49Rhs16qgANCP"

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
        204 -> IO.puts("Success - Deleted")
        _ -> IO.puts("Failed - Status Code: #{api_response.status_code}")
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
