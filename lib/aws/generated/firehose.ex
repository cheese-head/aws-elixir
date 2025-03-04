# WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
# See https://github.com/aws-beam/aws-codegen for more details.

defmodule AWS.Firehose do
  @moduledoc """
  Amazon Kinesis Data Firehose API Reference

  Amazon Kinesis Data Firehose is a fully managed service that delivers real-time
  streaming data to destinations such as Amazon Simple Storage Service (Amazon
  S3), Amazon OpenSearch Service, Amazon Redshift, Splunk, and various other
  supportd destinations.
  """

  alias AWS.Client
  alias AWS.Request

  def metadata do
    %{
      abbreviation: "Firehose",
      api_version: "2015-08-04",
      content_type: "application/x-amz-json-1.1",
      credential_scope: nil,
      endpoint_prefix: "firehose",
      global?: false,
      protocol: "json",
      service_id: "Firehose",
      signature_version: "v4",
      signing_name: "firehose",
      target_prefix: "Firehose_20150804"
    }
  end

  @doc """
  Creates a Kinesis Data Firehose delivery stream.

  By default, you can create up to 50 delivery streams per Amazon Web Services
  Region.

  This is an asynchronous operation that immediately returns. The initial status
  of the delivery stream is `CREATING`. After the delivery stream is created, its
  status is `ACTIVE` and it now accepts data. If the delivery stream creation
  fails, the status transitions to `CREATING_FAILED`. Attempts to send data to a
  delivery stream that is not in the `ACTIVE` state cause an exception. To check
  the state of a delivery stream, use `DescribeDeliveryStream`.

  If the status of a delivery stream is `CREATING_FAILED`, this status doesn't
  change, and you can't invoke `CreateDeliveryStream` again on it. However, you
  can invoke the `DeleteDeliveryStream` operation to delete it.

  A Kinesis Data Firehose delivery stream can be configured to receive records
  directly from providers using `PutRecord` or `PutRecordBatch`, or it can be
  configured to use an existing Kinesis stream as its source. To specify a Kinesis
  data stream as input, set the `DeliveryStreamType` parameter to
  `KinesisStreamAsSource`, and provide the Kinesis stream Amazon Resource Name
  (ARN) and role ARN in the `KinesisStreamSourceConfiguration` parameter.

  To create a delivery stream with server-side encryption (SSE) enabled, include
  `DeliveryStreamEncryptionConfigurationInput` in your request. This is optional.
  You can also invoke `StartDeliveryStreamEncryption` to turn on SSE for an
  existing delivery stream that doesn't have SSE enabled.

  A delivery stream is configured with a single destination, such as Amazon Simple
  Storage Service (Amazon S3), Amazon Redshift, Amazon OpenSearch Service, Amazon
  OpenSearch Serverless, Splunk, and any custom HTTP endpoint or HTTP endpoints
  owned by or supported by third-party service providers, including Datadog,
  Dynatrace, LogicMonitor, MongoDB, New Relic, and Sumo Logic. You must specify
  only one of the following destination configuration parameters:
  `ExtendedS3DestinationConfiguration`, `S3DestinationConfiguration`,
  `ElasticsearchDestinationConfiguration`, `RedshiftDestinationConfiguration`, or
  `SplunkDestinationConfiguration`.

  When you specify `S3DestinationConfiguration`, you can also provide the
  following optional values: BufferingHints, `EncryptionConfiguration`, and
  `CompressionFormat`. By default, if no `BufferingHints` value is provided,
  Kinesis Data Firehose buffers data up to 5 MB or for 5 minutes, whichever
  condition is satisfied first. `BufferingHints` is a hint, so there are some
  cases where the service cannot adhere to these conditions strictly. For example,
  record boundaries might be such that the size is a little over or under the
  configured buffering size. By default, no encryption is performed. We strongly
  recommend that you enable encryption to ensure secure data storage in Amazon S3.

  A few notes about Amazon Redshift as a destination:

    * An Amazon Redshift destination requires an S3 bucket as
  intermediate location. Kinesis Data Firehose first delivers data to Amazon S3
  and then uses `COPY` syntax to load data into an Amazon Redshift table. This is
  specified in the `RedshiftDestinationConfiguration.S3Configuration` parameter.

    * The compression formats `SNAPPY` or `ZIP` cannot be specified in
  `RedshiftDestinationConfiguration.S3Configuration` because the Amazon Redshift
  `COPY` operation that reads from the S3 bucket doesn't support these compression
  formats.

    * We strongly recommend that you use the user name and password you
  provide exclusively with Kinesis Data Firehose, and that the permissions for the
  account are restricted for Amazon Redshift `INSERT` permissions.

  Kinesis Data Firehose assumes the IAM role that is configured as part of the
  destination. The role should allow the Kinesis Data Firehose principal to assume
  the role, and the role should have permissions that allow the service to deliver
  the data. For more information, see [Grant Kinesis Data Firehose Access to an Amazon S3
  Destination](https://docs.aws.amazon.com/firehose/latest/dev/controlling-access.html#using-iam-s3)
  in the *Amazon Kinesis Data Firehose Developer Guide*.
  """
  def create_delivery_stream(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateDeliveryStream", input, options)
  end

  @doc """
  Deletes a delivery stream and its data.

  To check the state of a delivery stream, use `DescribeDeliveryStream`. You can
  delete a delivery stream only if it is in one of the following states: `ACTIVE`,
  `DELETING`, `CREATING_FAILED`, or `DELETING_FAILED`. You can't delete a delivery
  stream that is in the `CREATING` state. While the deletion request is in
  process, the delivery stream is in the `DELETING` state.

  While the delivery stream is in the `DELETING` state, the service might continue
  to accept records, but it doesn't make any guarantees with respect to delivering
  the data. Therefore, as a best practice, first stop any applications that are
  sending records before you delete a delivery stream.
  """
  def delete_delivery_stream(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteDeliveryStream", input, options)
  end

  @doc """
  Describes the specified delivery stream and its status.

  For example, after your delivery stream is created, call
  `DescribeDeliveryStream` to see whether the delivery stream is `ACTIVE` and
  therefore ready for data to be sent to it.

  If the status of a delivery stream is `CREATING_FAILED`, this status doesn't
  change, and you can't invoke `CreateDeliveryStream` again on it. However, you
  can invoke the `DeleteDeliveryStream` operation to delete it. If the status is
  `DELETING_FAILED`, you can force deletion by invoking `DeleteDeliveryStream`
  again but with `DeleteDeliveryStreamInput$AllowForceDelete` set to true.
  """
  def describe_delivery_stream(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeDeliveryStream", input, options)
  end

  @doc """
  Lists your delivery streams in alphabetical order of their names.

  The number of delivery streams might be too large to return using a single call
  to `ListDeliveryStreams`. You can limit the number of delivery streams returned,
  using the `Limit` parameter. To determine whether there are more delivery
  streams to list, check the value of `HasMoreDeliveryStreams` in the output. If
  there are more delivery streams to list, you can request them by calling this
  operation again and setting the `ExclusiveStartDeliveryStreamName` parameter to
  the name of the last delivery stream returned in the last call.
  """
  def list_delivery_streams(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListDeliveryStreams", input, options)
  end

  @doc """
  Lists the tags for the specified delivery stream.

  This operation has a limit of five transactions per second per account.
  """
  def list_tags_for_delivery_stream(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListTagsForDeliveryStream", input, options)
  end

  @doc """
  Writes a single data record into an Amazon Kinesis Data Firehose delivery
  stream.

  To write multiple data records into a delivery stream, use `PutRecordBatch`.
  Applications using these operations are referred to as producers.

  By default, each delivery stream can take in up to 2,000 transactions per
  second, 5,000 records per second, or 5 MB per second. If you use `PutRecord` and
  `PutRecordBatch`, the limits are an aggregate across these two operations for
  each delivery stream. For more information about limits and how to request an
  increase, see [Amazon Kinesis Data Firehose Limits](https://docs.aws.amazon.com/firehose/latest/dev/limits.html).

  Kinesis Data Firehose accumulates and publishes a particular metric for a
  customer account in one minute intervals. It is possible that the bursts of
  incoming bytes/records ingested to a delivery stream last only for a few
  seconds. Due to this, the actual spikes in the traffic might not be fully
  visible in the customer's 1 minute CloudWatch metrics.

  You must specify the name of the delivery stream and the data record when using
  `PutRecord`. The data record consists of a data blob that can be up to 1,000 KiB
  in size, and any kind of data. For example, it can be a segment from a log file,
  geographic location data, website clickstream data, and so on.

  Kinesis Data Firehose buffers records before delivering them to the destination.
  To disambiguate the data blobs at the destination, a common solution is to use
  delimiters in the data, such as a newline (`\n`) or some other character unique
  within the data. This allows the consumer application to parse individual data
  items when reading the data from the destination.

  The `PutRecord` operation returns a `RecordId`, which is a unique string
  assigned to each record. Producer applications can use this ID for purposes such
  as auditability and investigation.

  If the `PutRecord` operation throws a `ServiceUnavailableException`, the API is
  automatically reinvoked (retried) 3 times. If the exception persists, it is
  possible that the throughput limits have been exceeded for the delivery stream.

  Re-invoking the Put API operations (for example, PutRecord and PutRecordBatch)
  can result in data duplicates. For larger data assets, allow for a longer time
  out before retrying Put API operations.

  Data records sent to Kinesis Data Firehose are stored for 24 hours from the time
  they are added to a delivery stream as it tries to send the records to the
  destination. If the destination is unreachable for more than 24 hours, the data
  is no longer available.

  Don't concatenate two or more base64 strings to form the data fields of your
  records. Instead, concatenate the raw data, then perform base64 encoding.
  """
  def put_record(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "PutRecord", input, options)
  end

  @doc """
  Writes multiple data records into a delivery stream in a single call, which can
  achieve higher throughput per producer than when writing single records.

  To write single data records into a delivery stream, use `PutRecord`.
  Applications using these operations are referred to as producers.

  Kinesis Data Firehose accumulates and publishes a particular metric for a
  customer account in one minute intervals. It is possible that the bursts of
  incoming bytes/records ingested to a delivery stream last only for a few
  seconds. Due to this, the actual spikes in the traffic might not be fully
  visible in the customer's 1 minute CloudWatch metrics.

  For information about service quota, see [Amazon Kinesis Data Firehose Quota](https://docs.aws.amazon.com/firehose/latest/dev/limits.html).

  Each `PutRecordBatch` request supports up to 500 records. Each record in the
  request can be as large as 1,000 KB (before base64 encoding), up to a limit of 4
  MB for the entire request. These limits cannot be changed.

  You must specify the name of the delivery stream and the data record when using
  `PutRecord`. The data record consists of a data blob that can be up to 1,000 KB
  in size, and any kind of data. For example, it could be a segment from a log
  file, geographic location data, website clickstream data, and so on.

  Kinesis Data Firehose buffers records before delivering them to the destination.
  To disambiguate the data blobs at the destination, a common solution is to use
  delimiters in the data, such as a newline (`\n`) or some other character unique
  within the data. This allows the consumer application to parse individual data
  items when reading the data from the destination.

  The `PutRecordBatch` response includes a count of failed records,
  `FailedPutCount`, and an array of responses, `RequestResponses`. Even if the
  `PutRecordBatch` call succeeds, the value of `FailedPutCount` may be greater
  than 0, indicating that there are records for which the operation didn't
  succeed. Each entry in the `RequestResponses` array provides additional
  information about the processed record. It directly correlates with a record in
  the request array using the same ordering, from the top to the bottom. The
  response array always includes the same number of records as the request array.
  `RequestResponses` includes both successfully and unsuccessfully processed
  records. Kinesis Data Firehose tries to process all records in each
  `PutRecordBatch` request. A single record failure does not stop the processing
  of subsequent records.

  A successfully processed record includes a `RecordId` value, which is unique for
  the record. An unsuccessfully processed record includes `ErrorCode` and
  `ErrorMessage` values. `ErrorCode` reflects the type of error, and is one of the
  following values: `ServiceUnavailableException` or `InternalFailure`.
  `ErrorMessage` provides more detailed information about the error.

  If there is an internal server error or a timeout, the write might have
  completed or it might have failed. If `FailedPutCount` is greater than 0, retry
  the request, resending only those records that might have failed processing.
  This minimizes the possible duplicate records and also reduces the total bytes
  sent (and corresponding charges). We recommend that you handle any duplicates at
  the destination.

  If `PutRecordBatch` throws `ServiceUnavailableException`, the API is
  automatically reinvoked (retried) 3 times. If the exception persists, it is
  possible that the throughput limits have been exceeded for the delivery stream.

  Re-invoking the Put API operations (for example, PutRecord and PutRecordBatch)
  can result in data duplicates. For larger data assets, allow for a longer time
  out before retrying Put API operations.

  Data records sent to Kinesis Data Firehose are stored for 24 hours from the time
  they are added to a delivery stream as it attempts to send the records to the
  destination. If the destination is unreachable for more than 24 hours, the data
  is no longer available.

  Don't concatenate two or more base64 strings to form the data fields of your
  records. Instead, concatenate the raw data, then perform base64 encoding.
  """
  def put_record_batch(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "PutRecordBatch", input, options)
  end

  @doc """
  Enables server-side encryption (SSE) for the delivery stream.

  This operation is asynchronous. It returns immediately. When you invoke it,
  Kinesis Data Firehose first sets the encryption status of the stream to
  `ENABLING`, and then to `ENABLED`. The encryption status of a delivery stream is
  the `Status` property in `DeliveryStreamEncryptionConfiguration`. If the
  operation fails, the encryption status changes to `ENABLING_FAILED`. You can
  continue to read and write data to your delivery stream while the encryption
  status is `ENABLING`, but the data is not encrypted. It can take up to 5 seconds
  after the encryption status changes to `ENABLED` before all records written to
  the delivery stream are encrypted. To find out whether a record or a batch of
  records was encrypted, check the response elements `PutRecordOutput$Encrypted`
  and `PutRecordBatchOutput$Encrypted`, respectively.

  To check the encryption status of a delivery stream, use
  `DescribeDeliveryStream`.

  Even if encryption is currently enabled for a delivery stream, you can still
  invoke this operation on it to change the ARN of the CMK or both its type and
  ARN. If you invoke this method to change the CMK, and the old CMK is of type
  `CUSTOMER_MANAGED_CMK`, Kinesis Data Firehose schedules the grant it had on the
  old CMK for retirement. If the new CMK is of type `CUSTOMER_MANAGED_CMK`,
  Kinesis Data Firehose creates a grant that enables it to use the new CMK to
  encrypt and decrypt data and to manage the grant.

  For the KMS grant creation to be successful, Kinesis Data Firehose APIs
  `StartDeliveryStreamEncryption` and `CreateDeliveryStream` should not be called
  with session credentials that are more than 6 hours old.

  If a delivery stream already has encryption enabled and then you invoke this
  operation to change the ARN of the CMK or both its type and ARN and you get
  `ENABLING_FAILED`, this only means that the attempt to change the CMK failed. In
  this case, encryption remains enabled with the old CMK.

  If the encryption status of your delivery stream is `ENABLING_FAILED`, you can
  invoke this operation again with a valid CMK. The CMK must be enabled and the
  key policy mustn't explicitly deny the permission for Kinesis Data Firehose to
  invoke KMS encrypt and decrypt operations.

  You can enable SSE for a delivery stream only if it's a delivery stream that
  uses `DirectPut` as its source.

  The `StartDeliveryStreamEncryption` and `StopDeliveryStreamEncryption`
  operations have a combined limit of 25 calls per delivery stream per 24 hours.
  For example, you reach the limit if you call `StartDeliveryStreamEncryption` 13
  times and `StopDeliveryStreamEncryption` 12 times for the same delivery stream
  in a 24-hour period.
  """
  def start_delivery_stream_encryption(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "StartDeliveryStreamEncryption", input, options)
  end

  @doc """
  Disables server-side encryption (SSE) for the delivery stream.

  This operation is asynchronous. It returns immediately. When you invoke it,
  Kinesis Data Firehose first sets the encryption status of the stream to
  `DISABLING`, and then to `DISABLED`. You can continue to read and write data to
  your stream while its status is `DISABLING`. It can take up to 5 seconds after
  the encryption status changes to `DISABLED` before all records written to the
  delivery stream are no longer subject to encryption. To find out whether a
  record or a batch of records was encrypted, check the response elements
  `PutRecordOutput$Encrypted` and `PutRecordBatchOutput$Encrypted`, respectively.

  To check the encryption state of a delivery stream, use
  `DescribeDeliveryStream`.

  If SSE is enabled using a customer managed CMK and then you invoke
  `StopDeliveryStreamEncryption`, Kinesis Data Firehose schedules the related KMS
  grant for retirement and then retires it after it ensures that it is finished
  delivering records to the destination.

  The `StartDeliveryStreamEncryption` and `StopDeliveryStreamEncryption`
  operations have a combined limit of 25 calls per delivery stream per 24 hours.
  For example, you reach the limit if you call `StartDeliveryStreamEncryption` 13
  times and `StopDeliveryStreamEncryption` 12 times for the same delivery stream
  in a 24-hour period.
  """
  def stop_delivery_stream_encryption(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "StopDeliveryStreamEncryption", input, options)
  end

  @doc """
  Adds or updates tags for the specified delivery stream.

  A tag is a key-value pair that you can define and assign to Amazon Web Services
  resources. If you specify a tag that already exists, the tag value is replaced
  with the value that you specify in the request. Tags are metadata. For example,
  you can add friendly names and descriptions or other types of information that
  can help you distinguish the delivery stream. For more information about tags,
  see [Using Cost Allocation Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html)
  in the *Amazon Web Services Billing and Cost Management User Guide*.

  Each delivery stream can have up to 50 tags.

  This operation has a limit of five transactions per second per account.
  """
  def tag_delivery_stream(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "TagDeliveryStream", input, options)
  end

  @doc """
  Removes tags from the specified delivery stream.

  Removed tags are deleted, and you can't recover them after this operation
  successfully completes.

  If you specify a tag that doesn't exist, the operation ignores it.

  This operation has a limit of five transactions per second per account.
  """
  def untag_delivery_stream(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UntagDeliveryStream", input, options)
  end

  @doc """
  Updates the specified destination of the specified delivery stream.

  Use this operation to change the destination type (for example, to replace the
  Amazon S3 destination with Amazon Redshift) or change the parameters associated
  with a destination (for example, to change the bucket name of the Amazon S3
  destination). The update might not occur immediately. The target delivery stream
  remains active while the configurations are updated, so data writes to the
  delivery stream can continue during this process. The updated configurations are
  usually effective within a few minutes.

  Switching between Amazon OpenSearch Service and other services is not supported.
  For an Amazon OpenSearch Service destination, you can only update to another
  Amazon OpenSearch Service destination.

  If the destination type is the same, Kinesis Data Firehose merges the
  configuration parameters specified with the destination configuration that
  already exists on the delivery stream. If any of the parameters are not
  specified in the call, the existing values are retained. For example, in the
  Amazon S3 destination, if `EncryptionConfiguration` is not specified, then the
  existing `EncryptionConfiguration` is maintained on the destination.

  If the destination type is not the same, for example, changing the destination
  from Amazon S3 to Amazon Redshift, Kinesis Data Firehose does not merge any
  parameters. In this case, all parameters must be specified.

  Kinesis Data Firehose uses `CurrentDeliveryStreamVersionId` to avoid race
  conditions and conflicting merges. This is a required field, and the service
  updates the configuration only if the existing configuration has a version ID
  that matches. After the update is applied successfully, the version ID is
  updated, and can be retrieved using `DescribeDeliveryStream`. Use the new
  version ID to set `CurrentDeliveryStreamVersionId` in the next call.
  """
  def update_destination(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateDestination", input, options)
  end
end
