# WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
# See https://github.com/aws-beam/aws-codegen for more details.

defmodule AWS.SQS do
  @moduledoc """
  Welcome to the *Amazon SQS API Reference*.

  Amazon SQS is a reliable, highly-scalable hosted queue for storing messages as
  they travel between applications or microservices. Amazon SQS moves data between
  distributed application components and helps you decouple these components.

  For information on the permissions you need to use this API, see [Identity and access
  management](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-authentication-and-access-control.html)
  in the *Amazon SQS Developer Guide.*

  You can use [Amazon Web Services SDKs](http://aws.amazon.com/tools/#sdk) to access Amazon SQS using your favorite programming language. The SDKs perform
  tasks such as the following automatically:

    * Cryptographically sign your service requests

    * Retry requests

    * Handle error responses

  ## Additional information

    * [Amazon SQS Product Page](http://aws.amazon.com/sqs/)

    * *Amazon SQS Developer Guide*

      * [Making API Requests](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-making-api-requests.html)

      * [Amazon SQS Message Attributes](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-metadata.html#sqs-message-attributes)

      * [Amazon SQS Dead-Letter Queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html)

    * [Amazon SQS in the *Command Line Interface*
  ](http://docs.aws.amazon.com/cli/latest/reference/sqs/index.html)

    * *Amazon Web Services General Reference*

      * [Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html#sqs_region)
  """

  alias AWS.Client
  alias AWS.Request

  def metadata do
    %{
      abbreviation: "Amazon SQS",
      api_version: "2012-11-05",
      content_type: "application/x-amz-json-1.0",
      credential_scope: nil,
      endpoint_prefix: "sqs",
      global?: false,
      protocol: "json",
      service_id: "SQS",
      signature_version: "v4",
      signing_name: "sqs",
      target_prefix: "AmazonSQS"
    }
  end

  @doc """
  Adds a permission to a queue for a specific
  [principal](https://docs.aws.amazon.com/general/latest/gr/glos-chap.html#P).  This allows sharing access to the queue.

  When you create a queue, you have full control access rights for the queue. Only
  you, the owner of the queue, can grant or deny permissions to the queue. For
  more information about these permissions, see [Allow Developers to Write
  Messages to a Shared
  Queue](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-writing-an-sqs-policy.html#write-messages-to-shared-queue)
  in the *Amazon SQS Developer Guide*.

     `AddPermission` generates a policy for you. You can use `
  `SetQueueAttributes` ` to upload your policy. For more information, see [Using Custom Policies with the Amazon SQS Access Policy
  Language](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-creating-custom-policies.html)
  in the *Amazon SQS Developer Guide*.

     An Amazon SQS policy can have a maximum of seven actions per
  statement.

     To remove the ability to change queue permissions, you must deny
  permission to the `AddPermission`, `RemovePermission`, and `SetQueueAttributes`
  actions in your IAM policy.

     Amazon SQS `AddPermission` does not support adding a non-account
  principal.

  Cross-account permissions don't apply to this action. For more information, see
  [Grant cross-account permissions to a role and a username](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  in the *Amazon SQS Developer Guide*.
  """
  def add_permission(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "AddPermission", input, options)
  end

  @doc """
  Cancels a specified message movement task.

  A message movement can only be cancelled when the current status is RUNNING.
  Cancelling a message movement task does not revert the messages that have
  already been moved. It can only stop the messages that have not been moved yet.

     This action is currently limited to supporting message redrive from
  [dead-letter queues (DLQs)](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html)
  only. In this context, the source queue is the dead-letter queue (DLQ), while
  the destination queue can be the original source queue (from which the messages
  were driven to the dead-letter-queue), or a custom destination queue.

     Currently, only standard queues are supported.

     Only one active message movement task is supported per queue at any
  given time.
  """
  def cancel_message_move_task(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CancelMessageMoveTask", input, options)
  end

  @doc """
  Changes the visibility timeout of a specified message in a queue to a new value.

  The default visibility timeout for a message is 30 seconds. The minimum is 0
  seconds. The maximum is 12 hours. For more information, see [Visibility Timeout](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html)
  in the *Amazon SQS Developer Guide*.

  For example, if the default timeout for a queue is 60 seconds, 15 seconds have
  elapsed since you received the message, and you send a ChangeMessageVisibility
  call with `VisibilityTimeout` set to 10 seconds, the 10 seconds begin to count
  from the time that you make the `ChangeMessageVisibility` call. Thus, any
  attempt to change the visibility timeout or to delete that message 10 seconds
  after you initially change the visibility timeout (a total of 25 seconds) might
  result in an error.

  An Amazon SQS message has three basic states:

    1. Sent to a queue by a producer.

    2. Received from the queue by a consumer.

    3. Deleted from the queue.

  A message is considered to be *stored* after it is sent to a queue by a
  producer, but not yet received from the queue by a consumer (that is, between
  states 1 and 2). There is no limit to the number of stored messages. A message
  is considered to be *in flight* after it is received from a queue by a consumer,
  but not yet deleted from the queue (that is, between states 2 and 3). There is a
  limit to the number of in flight messages.

  Limits that apply to in flight messages are unrelated to the *unlimited* number
  of stored messages.

  For most standard queues (depending on queue traffic and message backlog), there
  can be a maximum of approximately 120,000 in flight messages (received from a
  queue by a consumer, but not yet deleted from the queue). If you reach this
  limit, Amazon SQS returns the `OverLimit` error message. To avoid reaching the
  limit, you should delete messages from the queue after they're processed. You
  can also increase the number of queues you use to process your messages. To
  request a limit increase, [file a support request](https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase&limitType=service-code-sqs).

  For FIFO queues, there can be a maximum of 20,000 in flight messages (received
  from a queue by a consumer, but not yet deleted from the queue). If you reach
  this limit, Amazon SQS returns no error messages.

  If you attempt to set the `VisibilityTimeout` to a value greater than the
  maximum time left, Amazon SQS returns an error. Amazon SQS doesn't automatically
  recalculate and increase the timeout to the maximum remaining time.

  Unlike with a queue, when you change the visibility timeout for a specific
  message the timeout value is applied immediately but isn't saved in memory for
  that message. If you don't delete a message after it is received, the visibility
  timeout for the message reverts to the original timeout value (not to the value
  you set using the `ChangeMessageVisibility` action) the next time the message is
  received.
  """
  def change_message_visibility(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ChangeMessageVisibility", input, options)
  end

  @doc """
  Changes the visibility timeout of multiple messages.

  This is a batch version of ` `ChangeMessageVisibility`.` The result of the
  action on each message is reported individually in the response. You can send up
  to 10 ` `ChangeMessageVisibility` ` requests with each
  `ChangeMessageVisibilityBatch` action.

  Because the batch request can result in a combination of successful and
  unsuccessful actions, you should check for batch errors even when the call
  returns an HTTP status code of `200`.
  """
  def change_message_visibility_batch(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ChangeMessageVisibilityBatch", input, options)
  end

  @doc """
  Creates a new standard or FIFO queue.

  You can pass one or more attributes in the request. Keep the following in mind:

    * If you don't specify the `FifoQueue` attribute, Amazon SQS creates
  a standard queue.

  You can't change the queue type after you create it and you can't convert an
  existing standard queue into a FIFO queue. You must either create a new FIFO
  queue for your application or delete your existing standard queue and recreate
  it as a FIFO queue. For more information, see [Moving From a Standard Queue to a FIFO
  Queue](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html#FIFO-queues-moving)
  in the *Amazon SQS Developer Guide*.

    * If you don't provide a value for an attribute, the queue is
  created with the default value for the attribute.

    * If you delete a queue, you must wait at least 60 seconds before
  creating a queue with the same name.

  To successfully create a new queue, you must provide a queue name that adheres
  to the [limits related to queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/limits-queues.html)
  and is unique within the scope of your queues.

  After you create a queue, you must wait at least one second after the queue is
  created to be able to use the queue.

  To get the queue URL, use the ` `GetQueueUrl` ` action. ` `GetQueueUrl` `
  requires only the `QueueName` parameter. be aware of existing queue names:

    * If you provide the name of an existing queue along with the exact
  names and values of all the queue's attributes, `CreateQueue` returns the queue
  URL for the existing queue.

    * If the queue name, attribute names, or attribute values don't
  match an existing queue, `CreateQueue` returns an error.

  Cross-account permissions don't apply to this action. For more information, see
  [Grant cross-account permissions to a role and a username](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  in the *Amazon SQS Developer Guide*.
  """
  def create_queue(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateQueue", input, options)
  end

  @doc """
  Deletes the specified message from the specified queue.

  To select the message to delete, use the `ReceiptHandle` of the message (*not*
  the `MessageId` which you receive when you send the message). Amazon SQS can
  delete a message from a queue even if a visibility timeout setting causes the
  message to be locked by another consumer. Amazon SQS automatically deletes
  messages left in a queue longer than the retention period configured for the
  queue.

  The `ReceiptHandle` is associated with a *specific instance* of receiving a
  message. If you receive a message more than once, the `ReceiptHandle` is
  different each time you receive a message. When you use the `DeleteMessage`
  action, you must provide the most recently received `ReceiptHandle` for the
  message (otherwise, the request succeeds, but the message will not be deleted).

  For standard queues, it is possible to receive a message even after you delete
  it. This might happen on rare occasions if one of the servers which stores a
  copy of the message is unavailable when you send the request to delete the
  message. The copy remains on the server and might be returned to you during a
  subsequent receive request. You should ensure that your application is
  idempotent, so that receiving a message more than once does not cause issues.
  """
  def delete_message(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteMessage", input, options)
  end

  @doc """
  Deletes up to ten messages from the specified queue.

  This is a batch version of ` `DeleteMessage`.` The result of the action on each
  message is reported individually in the response.

  Because the batch request can result in a combination of successful and
  unsuccessful actions, you should check for batch errors even when the call
  returns an HTTP status code of `200`.
  """
  def delete_message_batch(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteMessageBatch", input, options)
  end

  @doc """
  Deletes the queue specified by the `QueueUrl`, regardless of the queue's
  contents.

  Be careful with the `DeleteQueue` action: When you delete a queue, any messages
  in the queue are no longer available.

  When you delete a queue, the deletion process takes up to 60 seconds. Requests
  you send involving that queue during the 60 seconds might succeed. For example,
  a ` `SendMessage` ` request might succeed, but after 60 seconds the queue and
  the message you sent no longer exist.

  When you delete a queue, you must wait at least 60 seconds before creating a
  queue with the same name.

  Cross-account permissions don't apply to this action. For more information, see
  [Grant cross-account permissions to a role and a username](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  in the *Amazon SQS Developer Guide*.

  The delete operation uses the HTTP `GET` verb.
  """
  def delete_queue(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteQueue", input, options)
  end

  @doc """
  Gets attributes for the specified queue.

  To determine whether a queue is
  [FIFO](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html),
  you can check whether `QueueName` ends with the `.fifo` suffix.
  """
  def get_queue_attributes(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "GetQueueAttributes", input, options)
  end

  @doc """
  Returns the URL of an existing Amazon SQS queue.

  To access a queue that belongs to another AWS account, use the
  `QueueOwnerAWSAccountId` parameter to specify the account ID of the queue's
  owner. The queue's owner must grant you permission to access the queue. For more
  information about shared queue access, see ` `AddPermission` ` or see [Allow Developers to Write Messages to a Shared
  Queue](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-writing-an-sqs-policy.html#write-messages-to-shared-queue)
  in the *Amazon SQS Developer Guide*.
  """
  def get_queue_url(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "GetQueueUrl", input, options)
  end

  @doc """
  Returns a list of your queues that have the `RedrivePolicy` queue attribute
  configured with a dead-letter queue.

  The `ListDeadLetterSourceQueues` methods supports pagination. Set parameter
  `MaxResults` in the request to specify the maximum number of results to be
  returned in the response. If you do not set `MaxResults`, the response includes
  a maximum of 1,000 results. If you set `MaxResults` and there are additional
  results to display, the response includes a value for `NextToken`. Use
  `NextToken` as a parameter in your next request to `ListDeadLetterSourceQueues`
  to receive the next page of results.

  For more information about using dead-letter queues, see [Using Amazon SQS Dead-Letter
  Queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html)
  in the *Amazon SQS Developer Guide*.
  """
  def list_dead_letter_source_queues(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListDeadLetterSourceQueues", input, options)
  end

  @doc """
  Gets the most recent message movement tasks (up to 10) under a specific source
  queue.

     This action is currently limited to supporting message redrive from
  [dead-letter queues (DLQs)](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html)
  only. In this context, the source queue is the dead-letter queue (DLQ), while
  the destination queue can be the original source queue (from which the messages
  were driven to the dead-letter-queue), or a custom destination queue.

     Currently, only standard queues are supported.

     Only one active message movement task is supported per queue at any
  given time.
  """
  def list_message_move_tasks(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListMessageMoveTasks", input, options)
  end

  @doc """
  List all cost allocation tags added to the specified Amazon SQS queue.

  For an overview, see [Tagging Your Amazon SQS Queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html)
  in the *Amazon SQS Developer Guide*.

  Cross-account permissions don't apply to this action. For more information, see
  [Grant cross-account permissions to a role and a username](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  in the *Amazon SQS Developer Guide*.
  """
  def list_queue_tags(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListQueueTags", input, options)
  end

  @doc """
  Returns a list of your queues in the current region.

  The response includes a maximum of 1,000 results. If you specify a value for the
  optional `QueueNamePrefix` parameter, only queues with a name that begins with
  the specified value are returned.

  The `listQueues` methods supports pagination. Set parameter `MaxResults` in the
  request to specify the maximum number of results to be returned in the response.
  If you do not set `MaxResults`, the response includes a maximum of 1,000
  results. If you set `MaxResults` and there are additional results to display,
  the response includes a value for `NextToken`. Use `NextToken` as a parameter in
  your next request to `listQueues` to receive the next page of results.

  Cross-account permissions don't apply to this action. For more information, see
  [Grant cross-account permissions to a role and a username](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  in the *Amazon SQS Developer Guide*.
  """
  def list_queues(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListQueues", input, options)
  end

  @doc """
  Deletes available messages in a queue (including in-flight messages) specified
  by the `QueueURL` parameter.

  When you use the `PurgeQueue` action, you can't retrieve any messages deleted
  from a queue.

  The message deletion process takes up to 60 seconds. We recommend waiting for 60
  seconds regardless of your queue's size.

  Messages sent to the queue *before* you call `PurgeQueue` might be received but
  are deleted within the next minute.

  Messages sent to the queue *after* you call `PurgeQueue` might be deleted while
  the queue is being purged.
  """
  def purge_queue(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "PurgeQueue", input, options)
  end

  @doc """
  Retrieves one or more messages (up to 10), from the specified queue.

  Using the `WaitTimeSeconds` parameter enables long-poll support. For more
  information, see [Amazon SQS Long Polling](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-long-polling.html)
  in the *Amazon SQS Developer Guide*.

  Short poll is the default behavior where a weighted random set of machines is
  sampled on a `ReceiveMessage` call. Thus, only the messages on the sampled
  machines are returned. If the number of messages in the queue is small (fewer
  than 1,000), you most likely get fewer messages than you requested per
  `ReceiveMessage` call. If the number of messages in the queue is extremely
  small, you might not receive any messages in a particular `ReceiveMessage`
  response. If this happens, repeat the request.

  For each message returned, the response includes the following:

    * The message body.

    * An MD5 digest of the message body. For information about MD5, see
  [RFC1321](https://www.ietf.org/rfc/rfc1321.txt).     * The `MessageId` you received when you sent the message to the
  queue.

    * The receipt handle.

    * The message attributes.

    * An MD5 digest of the message attributes.

  The receipt handle is the identifier you must provide when deleting the message.
  For more information, see [Queue and Message
  Identifiers](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-message-identifiers.html)
  in the *Amazon SQS Developer Guide*.

  You can provide the `VisibilityTimeout` parameter in your request. The parameter
  is applied to the messages that Amazon SQS returns in the response. If you don't
  include the parameter, the overall visibility timeout for the queue is used for
  the returned messages. For more information, see [Visibility Timeout](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html)
  in the *Amazon SQS Developer Guide*.

  A message that isn't deleted or a message whose visibility isn't extended before
  the visibility timeout expires counts as a failed receive. Depending on the
  configuration of the queue, the message might be sent to the dead-letter queue.

  In the future, new attributes might be added. If you write code that calls this
  action, we recommend that you structure your code so that it can handle new
  attributes gracefully.
  """
  def receive_message(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ReceiveMessage", input, options)
  end

  @doc """
  Revokes any permissions in the queue policy that matches the specified `Label`
  parameter.

     Only the owner of a queue can remove permissions from it.

     Cross-account permissions don't apply to this action. For more
  information, see [Grant cross-account permissions to a role and a username](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  in the *Amazon SQS Developer Guide*.

     To remove the ability to change queue permissions, you must deny
  permission to the `AddPermission`, `RemovePermission`, and `SetQueueAttributes`
  actions in your IAM policy.
  """
  def remove_permission(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "RemovePermission", input, options)
  end

  @doc """
  Delivers a message to the specified queue.

  A message can include only XML, JSON, and unformatted text. The following
  Unicode characters are allowed:

  `#x9` | `#xA` | `#xD` | `#x20` to `#xD7FF` | `#xE000` to `#xFFFD` | `#x10000` to
  `#x10FFFF`

  Any characters not included in this list will be rejected. For more information,
  see the [W3C specification for characters](http://www.w3.org/TR/REC-xml/#charsets).
  """
  def send_message(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "SendMessage", input, options)
  end

  @doc """
  You can use `SendMessageBatch` to send up to 10 messages to the specified queue
  by assigning either identical or different values to each message (or by not
  assigning values at all).

  This is a batch version of ` `SendMessage`.` For a FIFO queue, multiple messages
  within a single batch are enqueued in the order they are sent.

  The result of sending each message is reported individually in the response.
  Because the batch request can result in a combination of successful and
  unsuccessful actions, you should check for batch errors even when the call
  returns an HTTP status code of `200`.

  The maximum allowed individual message size and the maximum total payload size
  (the sum of the individual lengths of all of the batched messages) are both 256
  KiB (262,144 bytes).

  A message can include only XML, JSON, and unformatted text. The following
  Unicode characters are allowed:

  `#x9` | `#xA` | `#xD` | `#x20` to `#xD7FF` | `#xE000` to `#xFFFD` | `#x10000` to
  `#x10FFFF`

  Any characters not included in this list will be rejected. For more information,
  see the [W3C specification for characters](http://www.w3.org/TR/REC-xml/#charsets).

  If you don't specify the `DelaySeconds` parameter for an entry, Amazon SQS uses
  the default value for the queue.
  """
  def send_message_batch(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "SendMessageBatch", input, options)
  end

  @doc """
  Sets the value of one or more queue attributes.

  When you change a queue's attributes, the change can take up to 60 seconds for
  most of the attributes to propagate throughout the Amazon SQS system. Changes
  made to the `MessageRetentionPeriod` attribute can take up to 15 minutes and
  will impact existing messages in the queue potentially causing them to be
  expired and deleted if the `MessageRetentionPeriod` is reduced below the age of
  existing messages.

     In the future, new attributes might be added. If you write code
  that calls this action, we recommend that you structure your code so that it can
  handle new attributes gracefully.

     Cross-account permissions don't apply to this action. For more
  information, see [Grant cross-account permissions to a role and a username](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  in the *Amazon SQS Developer Guide*.

     To remove the ability to change queue permissions, you must deny
  permission to the `AddPermission`, `RemovePermission`, and `SetQueueAttributes`
  actions in your IAM policy.
  """
  def set_queue_attributes(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "SetQueueAttributes", input, options)
  end

  @doc """
  Starts an asynchronous task to move messages from a specified source queue to a
  specified destination queue.

     This action is currently limited to supporting message redrive from
  queues that are configured as [dead-letter queues (DLQs)](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html)
  of other Amazon SQS queues only. Non-SQS queue sources of dead-letter queues,
  such as Lambda or Amazon SNS topics, are currently not supported.

     In dead-letter queues redrive context, the `StartMessageMoveTask`
  the source queue is the DLQ, while the destination queue can be the original
  source queue (from which the messages were driven to the dead-letter-queue), or
  a custom destination queue.

     Currently, only standard queues support redrive. FIFO queues don't
  support redrive.

     Only one active message movement task is supported per queue at any
  given time.
  """
  def start_message_move_task(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "StartMessageMoveTask", input, options)
  end

  @doc """
  Add cost allocation tags to the specified Amazon SQS queue.

  For an overview, see [Tagging Your Amazon SQS Queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html)
  in the *Amazon SQS Developer Guide*.

  When you use queue tags, keep the following guidelines in mind:

    * Adding more than 50 tags to a queue isn't recommended.

    * Tags don't have any semantic meaning. Amazon SQS interprets tags
  as character strings.

    * Tags are case-sensitive.

    * A new tag with a key identical to that of an existing tag
  overwrites the existing tag.

  For a full list of tag restrictions, see [Quotas related to queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-limits.html#limits-queues)
  in the *Amazon SQS Developer Guide*.

  Cross-account permissions don't apply to this action. For more information, see
  [Grant cross-account permissions to a role and a username](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  in the *Amazon SQS Developer Guide*.
  """
  def tag_queue(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "TagQueue", input, options)
  end

  @doc """
  Remove cost allocation tags from the specified Amazon SQS queue.

  For an overview, see [Tagging Your Amazon SQS Queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html)
  in the *Amazon SQS Developer Guide*.

  Cross-account permissions don't apply to this action. For more information, see
  [Grant cross-account permissions to a role and a username](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  in the *Amazon SQS Developer Guide*.
  """
  def untag_queue(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UntagQueue", input, options)
  end
end
