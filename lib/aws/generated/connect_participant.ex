# WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
# See https://github.com/aws-beam/aws-codegen for more details.

defmodule AWS.ConnectParticipant do
  @moduledoc """
  Amazon Connect is an easy-to-use omnichannel cloud contact center service that
  enables companies of any size to deliver superior customer service at a lower
  cost.

  Amazon Connect communications capabilities make it easy for companies to deliver
  personalized interactions across communication channels, including chat.

  Use the Amazon Connect Participant Service to manage participants (for example,
  agents, customers, and managers listening in), and to send messages and events
  within a chat contact. The APIs in the service enable the following: sending
  chat messages, attachment sharing, managing a participant's connection state and
  message events, and retrieving chat transcripts.
  """

  alias AWS.Client
  alias AWS.Request

  def metadata do
    %{
      abbreviation: nil,
      api_version: "2018-09-07",
      content_type: "application/x-amz-json-1.1",
      credential_scope: nil,
      endpoint_prefix: "participant.connect",
      global?: false,
      protocol: "rest-json",
      service_id: "ConnectParticipant",
      signature_version: "v4",
      signing_name: "execute-api",
      target_prefix: nil
    }
  end

  @doc """
  Allows you to confirm that the attachment has been uploaded using the pre-signed
  URL provided in StartAttachmentUpload API.

  `ConnectionToken` is used for invoking this API instead of `ParticipantToken`.

  The Amazon Connect Participant Service APIs do not use [Signature Version 4 authentication](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
  """
  def complete_attachment_upload(%Client{} = client, input, options \\ []) do
    url_path = "/participant/complete-attachment-upload"

    {headers, input} =
      [
        {"ConnectionToken", "X-Amz-Bearer"}
      ]
      |> Request.build_params(input)

    query_params = []

    meta = metadata()

    Request.request_rest(
      client,
      meta,
      :post,
      url_path,
      query_params,
      headers,
      input,
      options,
      nil
    )
  end

  @doc """
  Creates the participant's connection.

  `ParticipantToken` is used for invoking this API instead of `ConnectionToken`.

  The participant token is valid for the lifetime of the participant – until they
  are part of a contact.

  The response URL for `WEBSOCKET` Type has a connect expiry timeout of 100s.
  Clients must manually connect to the returned websocket URL and subscribe to the
  desired topic.

  For chat, you need to publish the following on the established websocket
  connection:

  `{"topic":"aws/subscribe","content":{"topics":["aws/chat"]}}`  Upon websocket URL expiry, as specified in the response ConnectionExpiry
  parameter, clients need to call this API again to obtain a new websocket URL and
  perform the same steps as before.

  **Message streaming support**: This API can also be used together with the
  [StartContactStreaming](https://docs.aws.amazon.com/connect/latest/APIReference/API_StartContactStreaming.html)
  API to create a participant connection for chat contacts that are not using a
  websocket. For more information about message streaming, [Enable real-time chat message
  streaming](https://docs.aws.amazon.com/connect/latest/adminguide/chat-message-streaming.html)
  in the *Amazon Connect Administrator Guide*.

  **Feature specifications**: For information about feature specifications, such
  as the allowed number of open websocket connections per participant, see
  [Feature specifications](https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#feature-limits)
  in the *Amazon Connect Administrator Guide*.

  The Amazon Connect Participant Service APIs do not use [Signature Version 4 authentication](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
  """
  def create_participant_connection(%Client{} = client, input, options \\ []) do
    url_path = "/participant/connection"

    {headers, input} =
      [
        {"ParticipantToken", "X-Amz-Bearer"}
      ]
      |> Request.build_params(input)

    query_params = []

    meta = metadata()

    Request.request_rest(
      client,
      meta,
      :post,
      url_path,
      query_params,
      headers,
      input,
      options,
      nil
    )
  end

  @doc """
  Retrieves the view for the specified view token.
  """
  def describe_view(%Client{} = client, view_token, connection_token, options \\ []) do
    url_path = "/participant/views/#{AWS.Util.encode_uri(view_token)}"
    headers = []

    headers =
      if !is_nil(connection_token) do
        [{"X-Amz-Bearer", connection_token} | headers]
      else
        headers
      end

    query_params = []

    meta = metadata()

    Request.request_rest(client, meta, :get, url_path, query_params, headers, nil, options, nil)
  end

  @doc """
  Disconnects a participant.

  `ConnectionToken` is used for invoking this API instead of `ParticipantToken`.

  The Amazon Connect Participant Service APIs do not use [Signature Version 4 authentication](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
  """
  def disconnect_participant(%Client{} = client, input, options \\ []) do
    url_path = "/participant/disconnect"

    {headers, input} =
      [
        {"ConnectionToken", "X-Amz-Bearer"}
      ]
      |> Request.build_params(input)

    query_params = []

    meta = metadata()

    Request.request_rest(
      client,
      meta,
      :post,
      url_path,
      query_params,
      headers,
      input,
      options,
      nil
    )
  end

  @doc """
  Provides a pre-signed URL for download of a completed attachment.

  This is an asynchronous API for use with active contacts.

  `ConnectionToken` is used for invoking this API instead of `ParticipantToken`.

  The Amazon Connect Participant Service APIs do not use [Signature Version 4 authentication](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
  """
  def get_attachment(%Client{} = client, input, options \\ []) do
    url_path = "/participant/attachment"

    {headers, input} =
      [
        {"ConnectionToken", "X-Amz-Bearer"}
      ]
      |> Request.build_params(input)

    query_params = []

    meta = metadata()

    Request.request_rest(
      client,
      meta,
      :post,
      url_path,
      query_params,
      headers,
      input,
      options,
      nil
    )
  end

  @doc """
  Retrieves a transcript of the session, including details about any attachments.

  For information about accessing past chat contact transcripts for a persistent
  chat, see [Enable persistent chat](https://docs.aws.amazon.com/connect/latest/adminguide/chat-persistence.html).

  `ConnectionToken` is used for invoking this API instead of `ParticipantToken`.

  The Amazon Connect Participant Service APIs do not use [Signature Version 4 authentication](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
  """
  def get_transcript(%Client{} = client, input, options \\ []) do
    url_path = "/participant/transcript"

    {headers, input} =
      [
        {"ConnectionToken", "X-Amz-Bearer"}
      ]
      |> Request.build_params(input)

    query_params = []

    meta = metadata()

    Request.request_rest(
      client,
      meta,
      :post,
      url_path,
      query_params,
      headers,
      input,
      options,
      nil
    )
  end

  @doc """
  Sends an event.

  `ConnectionToken` is used for invoking this API instead of `ParticipantToken`.

  The Amazon Connect Participant Service APIs do not use [Signature Version 4 authentication](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
  """
  def send_event(%Client{} = client, input, options \\ []) do
    url_path = "/participant/event"

    {headers, input} =
      [
        {"ConnectionToken", "X-Amz-Bearer"}
      ]
      |> Request.build_params(input)

    query_params = []

    meta = metadata()

    Request.request_rest(
      client,
      meta,
      :post,
      url_path,
      query_params,
      headers,
      input,
      options,
      nil
    )
  end

  @doc """
  Sends a message.

  `ConnectionToken` is used for invoking this API instead of `ParticipantToken`.

  The Amazon Connect Participant Service APIs do not use [Signature Version 4 authentication](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
  """
  def send_message(%Client{} = client, input, options \\ []) do
    url_path = "/participant/message"

    {headers, input} =
      [
        {"ConnectionToken", "X-Amz-Bearer"}
      ]
      |> Request.build_params(input)

    query_params = []

    meta = metadata()

    Request.request_rest(
      client,
      meta,
      :post,
      url_path,
      query_params,
      headers,
      input,
      options,
      nil
    )
  end

  @doc """
  Provides a pre-signed Amazon S3 URL in response for uploading the file directly
  to S3.

  `ConnectionToken` is used for invoking this API instead of `ParticipantToken`.

  The Amazon Connect Participant Service APIs do not use [Signature Version 4 authentication](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
  """
  def start_attachment_upload(%Client{} = client, input, options \\ []) do
    url_path = "/participant/start-attachment-upload"

    {headers, input} =
      [
        {"ConnectionToken", "X-Amz-Bearer"}
      ]
      |> Request.build_params(input)

    query_params = []

    meta = metadata()

    Request.request_rest(
      client,
      meta,
      :post,
      url_path,
      query_params,
      headers,
      input,
      options,
      nil
    )
  end
end
