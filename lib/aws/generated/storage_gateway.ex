# WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
# See https://github.com/aws-beam/aws-codegen for more details.

defmodule AWS.StorageGateway do
  @moduledoc """
  Storage Gateway Service

  Storage Gateway is the service that connects an on-premises software appliance
  with cloud-based storage to provide seamless and secure integration between an
  organization's on-premises IT environment and the Amazon Web Services storage
  infrastructure.

  The service enables you to securely upload data to the Amazon Web Services Cloud
  for cost effective backup and rapid disaster recovery.

  Use the following links to get started using the *Storage Gateway Service API
  Reference*:

    * [Storage Gateway required request headers](https://docs.aws.amazon.com/storagegateway/latest/userguide/AWSStorageGatewayAPI.html#AWSStorageGatewayHTTPRequestsHeaders):
  Describes the required headers that you must send with every POST request to
  Storage Gateway.

    * [Signing requests](https://docs.aws.amazon.com/storagegateway/latest/userguide/AWSStorageGatewayAPI.html#AWSStorageGatewaySigningRequests):
  Storage Gateway requires that you authenticate every request you send; this
  topic describes how sign such a request.

    * [Error responses](https://docs.aws.amazon.com/storagegateway/latest/userguide/AWSStorageGatewayAPI.html#APIErrorResponses):
  Provides reference information about Storage Gateway errors.

    * [Operations in Storage Gateway](https://docs.aws.amazon.com/storagegateway/latest/APIReference/API_Operations.html):
  Contains detailed descriptions of all Storage Gateway operations, their request
  parameters, response elements, possible errors, and examples of requests and
  responses.

    * [Storage Gateway endpoints and quotas](https://docs.aws.amazon.com/general/latest/gr/sg.html): Provides a list
  of each Amazon Web Services Region and the endpoints available for use with
  Storage Gateway.

  Storage Gateway resource IDs are in uppercase. When you use these resource IDs
  with the Amazon EC2 API, EC2 expects resource IDs in lowercase. You must change
  your resource ID to lowercase to use it with the EC2 API. For example, in
  Storage Gateway the ID for a volume might be `vol-AA22BB012345DAF670`. When you
  use this ID with the EC2 API, you must change it to `vol-aa22bb012345daf670`.
  Otherwise, the EC2 API might not behave as expected.

  IDs for Storage Gateway volumes and Amazon EBS snapshots created from gateway
  volumes are changing to a longer format. Starting in December 2016, all new
  volumes and snapshots will be created with a 17-character string. Starting in
  April 2016, you will be able to use these longer IDs so you can test your
  systems with the new format. For more information, see [Longer EC2 and EBS resource IDs](http://aws.amazon.com/ec2/faqs/#longer-ids).

  For example, a volume Amazon Resource Name (ARN) with the longer volume ID
  format looks like the following:

  `arn:aws:storagegateway:us-west-2:111122223333:gateway/sgw-12A3456B/volume/vol-1122AABBCCDDEEFFG`.

  A snapshot ID with the longer ID format looks like the following:
  `snap-78e226633445566ee`.

  For more information, see [Announcement: Heads-up – Longer Storage Gateway volume and snapshot IDs coming in
  2016](http://forums.aws.amazon.com/ann.jspa?annID=3557).
  """

  alias AWS.Client
  alias AWS.Request

  def metadata do
    %{
      abbreviation: nil,
      api_version: "2013-06-30",
      content_type: "application/x-amz-json-1.1",
      credential_scope: nil,
      endpoint_prefix: "storagegateway",
      global?: false,
      protocol: "json",
      service_id: "Storage Gateway",
      signature_version: "v4",
      signing_name: "storagegateway",
      target_prefix: "StorageGateway_20130630"
    }
  end

  @doc """
  Activates the gateway you previously deployed on your host.

  In the activation process, you specify information such as the Amazon Web
  Services Region that you want to use for storing snapshots or tapes, the time
  zone for scheduled snapshots the gateway snapshot schedule window, an activation
  key, and a name for your gateway. The activation process also associates your
  gateway with your account. For more information, see `UpdateGatewayInformation`.

  You must turn on the gateway VM before you can activate your gateway.
  """
  def activate_gateway(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ActivateGateway", input, options)
  end

  @doc """
  Configures one or more gateway local disks as cache for a gateway.

  This operation is only supported in the cached volume, tape, and file gateway
  type (see [How Storage Gateway works (architecture)](https://docs.aws.amazon.com/storagegateway/latest/userguide/StorageGatewayConcepts.html).

  In the request, you specify the gateway Amazon Resource Name (ARN) to which you
  want to add cache, and one or more disk IDs that you want to configure as cache.
  """
  def add_cache(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "AddCache", input, options)
  end

  @doc """
  Adds one or more tags to the specified resource.

  You use tags to add metadata to resources, which you can use to categorize these
  resources. For example, you can categorize resources by purpose, owner,
  environment, or team. Each tag consists of a key and a value, which you define.
  You can add tags to the following Storage Gateway resources:

    * Storage gateways of all types

    * Storage volumes

    * Virtual tapes

    * NFS and SMB file shares

    * File System associations

  You can create a maximum of 50 tags for each resource. Virtual tapes and storage
  volumes that are recovered to a new gateway maintain their tags.
  """
  def add_tags_to_resource(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "AddTagsToResource", input, options)
  end

  @doc """
  Configures one or more gateway local disks as upload buffer for a specified
  gateway.

  This operation is supported for the stored volume, cached volume, and tape
  gateway types.

  In the request, you specify the gateway Amazon Resource Name (ARN) to which you
  want to add upload buffer, and one or more disk IDs that you want to configure
  as upload buffer.
  """
  def add_upload_buffer(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "AddUploadBuffer", input, options)
  end

  @doc """
  Configures one or more gateway local disks as working storage for a gateway.

  This operation is only supported in the stored volume gateway type. This
  operation is deprecated in cached volume API version 20120630. Use
  `AddUploadBuffer` instead.

  Working storage is also referred to as upload buffer. You can also use the
  `AddUploadBuffer` operation to add upload buffer to a stored volume gateway.

  In the request, you specify the gateway Amazon Resource Name (ARN) to which you
  want to add working storage, and one or more disk IDs that you want to configure
  as working storage.
  """
  def add_working_storage(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "AddWorkingStorage", input, options)
  end

  @doc """
  Assigns a tape to a tape pool for archiving.

  The tape assigned to a pool is archived in the S3 storage class that is
  associated with the pool. When you use your backup application to eject the
  tape, the tape is archived directly into the S3 storage class (S3 Glacier or S3
  Glacier Deep Archive) that corresponds to the pool.
  """
  def assign_tape_pool(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "AssignTapePool", input, options)
  end

  @doc """
  Associate an Amazon FSx file system with the FSx File Gateway.

  After the association process is complete, the file shares on the Amazon FSx
  file system are available for access through the gateway. This operation only
  supports the FSx File Gateway type.
  """
  def associate_file_system(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "AssociateFileSystem", input, options)
  end

  @doc """
  Connects a volume to an iSCSI connection and then attaches the volume to the
  specified gateway.

  Detaching and attaching a volume enables you to recover your data from one
  gateway to a different gateway without creating a snapshot. It also makes it
  easier to move your volumes from an on-premises gateway to a gateway hosted on
  an Amazon EC2 instance.
  """
  def attach_volume(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "AttachVolume", input, options)
  end

  @doc """
  Cancels archiving of a virtual tape to the virtual tape shelf (VTS) after the
  archiving process is initiated.

  This operation is only supported in the tape gateway type.
  """
  def cancel_archival(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CancelArchival", input, options)
  end

  @doc """
  Cancels retrieval of a virtual tape from the virtual tape shelf (VTS) to a
  gateway after the retrieval process is initiated.

  The virtual tape is returned to the VTS. This operation is only supported in the
  tape gateway type.
  """
  def cancel_retrieval(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CancelRetrieval", input, options)
  end

  @doc """
  Creates a cached volume on a specified cached volume gateway.

  This operation is only supported in the cached volume gateway type.

  Cache storage must be allocated to the gateway before you can create a cached
  volume. Use the `AddCache` operation to add cache storage to a gateway.

  In the request, you must specify the gateway, size of the volume in bytes, the
  iSCSI target name, an IP address on which to expose the target, and a unique
  client token. In response, the gateway creates the volume and returns
  information about it. This information includes the volume Amazon Resource Name
  (ARN), its size, and the iSCSI target ARN that initiators can use to connect to
  the volume target.

  Optionally, you can provide the ARN for an existing volume as the
  `SourceVolumeARN` for this cached volume, which creates an exact copy of the
  existing volume’s latest recovery point. The `VolumeSizeInBytes` value must be
  equal to or larger than the size of the copied volume, in bytes.
  """
  def create_cached_iscsi_volume(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateCachediSCSIVolume", input, options)
  end

  @doc """
  Creates a Network File System (NFS) file share on an existing S3 File Gateway.

  In Storage Gateway, a file share is a file system mount point backed by Amazon
  S3 cloud storage. Storage Gateway exposes file shares using an NFS interface.
  This operation is only supported for S3 File Gateways.

  S3 File gateway requires Security Token Service (Amazon Web Services STS) to be
  activated to enable you to create a file share. Make sure Amazon Web Services
  STS is activated in the Amazon Web Services Region you are creating your S3 File
  Gateway in. If Amazon Web Services STS is not activated in the Amazon Web
  Services Region, activate it. For information about how to activate Amazon Web
  Services STS, see [Activating and deactivating Amazon Web Services STS in an Amazon Web Services
  Region](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html)
  in the *Identity and Access Management User Guide*.

  S3 File Gateways do not support creating hard or symbolic links on a file share.
  """
  def create_nfs_file_share(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateNFSFileShare", input, options)
  end

  @doc """
  Creates a Server Message Block (SMB) file share on an existing S3 File Gateway.

  In Storage Gateway, a file share is a file system mount point backed by Amazon
  S3 cloud storage. Storage Gateway exposes file shares using an SMB interface.
  This operation is only supported for S3 File Gateways.

  S3 File Gateways require Security Token Service (Amazon Web Services STS) to be
  activated to enable you to create a file share. Make sure that Amazon Web
  Services STS is activated in the Amazon Web Services Region you are creating
  your S3 File Gateway in. If Amazon Web Services STS is not activated in this
  Amazon Web Services Region, activate it. For information about how to activate
  Amazon Web Services STS, see [Activating and deactivating Amazon Web Services STS in an Amazon Web Services
  Region](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html)
  in the *Identity and Access Management User Guide*.

  File gateways don't support creating hard or symbolic links on a file share.
  """
  def create_smb_file_share(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateSMBFileShare", input, options)
  end

  @doc """
  Initiates a snapshot of a volume.

  Storage Gateway provides the ability to back up point-in-time snapshots of your
  data to Amazon Simple Storage (Amazon S3) for durable off-site recovery, and
  also import the data to an Amazon Elastic Block Store (EBS) volume in Amazon
  Elastic Compute Cloud (EC2). You can take snapshots of your gateway volume on a
  scheduled or ad hoc basis. This API enables you to take an ad hoc snapshot. For
  more information, see [Editing a snapshot schedule](https://docs.aws.amazon.com/storagegateway/latest/userguide/managing-volumes.html#SchedulingSnapshot).

  In the `CreateSnapshot` request, you identify the volume by providing its Amazon
  Resource Name (ARN). You must also provide description for the snapshot. When
  Storage Gateway takes the snapshot of specified volume, the snapshot and
  description appears in the Storage Gateway console. In response, Storage Gateway
  returns you a snapshot ID. You can use this snapshot ID to check the snapshot
  progress or later use it when you want to create a volume from a snapshot. This
  operation is only supported in stored and cached volume gateway type.

  To list or delete a snapshot, you must use the Amazon EC2 API. For more
  information, see
  [DescribeSnapshots](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSnapshots.html) or
  [DeleteSnapshot](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DeleteSnapshot.html)
  in the *Amazon Elastic Compute Cloud API Reference*.

  Volume and snapshot IDs are changing to a longer length ID format. For more
  information, see the important note on the
  [Welcome](https://docs.aws.amazon.com/storagegateway/latest/APIReference/Welcome.html)
  page.
  """
  def create_snapshot(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateSnapshot", input, options)
  end

  @doc """
  Initiates a snapshot of a gateway from a volume recovery point.

  This operation is only supported in the cached volume gateway type.

  A volume recovery point is a point in time at which all data of the volume is
  consistent and from which you can create a snapshot. To get a list of volume
  recovery point for cached volume gateway, use `ListVolumeRecoveryPoints`.

  In the `CreateSnapshotFromVolumeRecoveryPoint` request, you identify the volume
  by providing its Amazon Resource Name (ARN). You must also provide a description
  for the snapshot. When the gateway takes a snapshot of the specified volume, the
  snapshot and its description appear in the Storage Gateway console. In response,
  the gateway returns you a snapshot ID. You can use this snapshot ID to check the
  snapshot progress or later use it when you want to create a volume from a
  snapshot.

  To list or delete a snapshot, you must use the Amazon EC2 API. For more
  information, see
  [DescribeSnapshots](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSnapshots.html) or
  [DeleteSnapshot](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DeleteSnapshot.html)
  in the *Amazon Elastic Compute Cloud API Reference*.
  """
  def create_snapshot_from_volume_recovery_point(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateSnapshotFromVolumeRecoveryPoint", input, options)
  end

  @doc """
  Creates a volume on a specified gateway.

  This operation is only supported in the stored volume gateway type.

  The size of the volume to create is inferred from the disk size. You can choose
  to preserve existing data on the disk, create volume from an existing snapshot,
  or create an empty volume. If you choose to create an empty gateway volume, then
  any existing data on the disk is erased.

  In the request, you must specify the gateway and the disk information on which
  you are creating the volume. In response, the gateway creates the volume and
  returns volume information such as the volume Amazon Resource Name (ARN), its
  size, and the iSCSI target ARN that initiators can use to connect to the volume
  target.
  """
  def create_stored_iscsi_volume(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateStorediSCSIVolume", input, options)
  end

  @doc """
  Creates a new custom tape pool.

  You can use custom tape pool to enable tape retention lock on tapes that are
  archived in the custom pool.
  """
  def create_tape_pool(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateTapePool", input, options)
  end

  @doc """
  Creates a virtual tape by using your own barcode.

  You write data to the virtual tape and then archive the tape. A barcode is
  unique and cannot be reused if it has already been used on a tape. This applies
  to barcodes used on deleted tapes. This operation is only supported in the tape
  gateway type.

  Cache storage must be allocated to the gateway before you can create a virtual
  tape. Use the `AddCache` operation to add cache storage to a gateway.
  """
  def create_tape_with_barcode(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateTapeWithBarcode", input, options)
  end

  @doc """
  Creates one or more virtual tapes.

  You write data to the virtual tapes and then archive the tapes. This operation
  is only supported in the tape gateway type.

  Cache storage must be allocated to the gateway before you can create virtual
  tapes. Use the `AddCache` operation to add cache storage to a gateway.
  """
  def create_tapes(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateTapes", input, options)
  end

  @doc """
  Deletes the automatic tape creation policy of a gateway.

  If you delete this policy, new virtual tapes must be created manually. Use the
  Amazon Resource Name (ARN) of the gateway in your request to remove the policy.
  """
  def delete_automatic_tape_creation_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteAutomaticTapeCreationPolicy", input, options)
  end

  @doc """
  Deletes the bandwidth rate limits of a gateway.

  You can delete either the upload and download bandwidth rate limit, or you can
  delete both. If you delete only one of the limits, the other limit remains
  unchanged. To specify which gateway to work with, use the Amazon Resource Name
  (ARN) of the gateway in your request. This operation is supported only for the
  stored volume, cached volume, and tape gateway types.
  """
  def delete_bandwidth_rate_limit(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteBandwidthRateLimit", input, options)
  end

  @doc """
  Deletes Challenge-Handshake Authentication Protocol (CHAP) credentials for a
  specified iSCSI target and initiator pair.

  This operation is supported in volume and tape gateway types.
  """
  def delete_chap_credentials(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteChapCredentials", input, options)
  end

  @doc """
  Deletes a file share from an S3 File Gateway.

  This operation is only supported for S3 File Gateways.
  """
  def delete_file_share(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteFileShare", input, options)
  end

  @doc """
  Deletes a gateway.

  To specify which gateway to delete, use the Amazon Resource Name (ARN) of the
  gateway in your request. The operation deletes the gateway; however, it does not
  delete the gateway virtual machine (VM) from your host computer.

  After you delete a gateway, you cannot reactivate it. Completed snapshots of the
  gateway volumes are not deleted upon deleting the gateway, however, pending
  snapshots will not complete. After you delete a gateway, your next step is to
  remove it from your environment.

  You no longer pay software charges after the gateway is deleted; however, your
  existing Amazon EBS snapshots persist and you will continue to be billed for
  these snapshots. You can choose to remove all remaining Amazon EBS snapshots by
  canceling your Amazon EC2 subscription.  If you prefer not to cancel your Amazon
  EC2 subscription, you can delete your snapshots using the Amazon EC2 console.
  For more information, see the [Storage Gateway detail page](http://aws.amazon.com/storagegateway).
  """
  def delete_gateway(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteGateway", input, options)
  end

  @doc """
  Deletes a snapshot of a volume.

  You can take snapshots of your gateway volumes on a scheduled or ad hoc basis.
  This API action enables you to delete a snapshot schedule for a volume. For more
  information, see [Backing up your volumes](https://docs.aws.amazon.com/storagegateway/latest/userguide/backing-up-volumes.html).
  In the `DeleteSnapshotSchedule` request, you identify the volume by providing
  its Amazon Resource Name (ARN). This operation is only supported for cached
  volume gateway types.

  To list or delete a snapshot, you must use the Amazon EC2 API. For more
  information, go to
  [DescribeSnapshots](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSnapshots.html)
  in the *Amazon Elastic Compute Cloud API Reference*.
  """
  def delete_snapshot_schedule(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteSnapshotSchedule", input, options)
  end

  @doc """
  Deletes the specified virtual tape.

  This operation is only supported in the tape gateway type.
  """
  def delete_tape(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteTape", input, options)
  end

  @doc """
  Deletes the specified virtual tape from the virtual tape shelf (VTS).

  This operation is only supported in the tape gateway type.
  """
  def delete_tape_archive(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteTapeArchive", input, options)
  end

  @doc """
  Delete a custom tape pool.

  A custom tape pool can only be deleted if there are no tapes in the pool and if
  there are no automatic tape creation policies that reference the custom tape
  pool.
  """
  def delete_tape_pool(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteTapePool", input, options)
  end

  @doc """
  Deletes the specified storage volume that you previously created using the
  `CreateCachediSCSIVolume` or `CreateStorediSCSIVolume` API.

  This operation is only supported in the cached volume and stored volume types.
  For stored volume gateways, the local disk that was configured as the storage
  volume is not deleted. You can reuse the local disk to create another storage
  volume.

  Before you delete a volume, make sure there are no iSCSI connections to the
  volume you are deleting. You should also make sure there is no snapshot in
  progress. You can use the Amazon Elastic Compute Cloud (Amazon EC2) API to query
  snapshots on the volume you are deleting and check the snapshot status. For more
  information, go to
  [DescribeSnapshots](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DescribeSnapshots.html)
  in the *Amazon Elastic Compute Cloud API Reference*.

  In the request, you must provide the Amazon Resource Name (ARN) of the storage
  volume you want to delete.
  """
  def delete_volume(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteVolume", input, options)
  end

  @doc """
  Returns information about the most recent high availability monitoring test that
  was performed on the host in a cluster.

  If a test isn't performed, the status and start time in the response would be
  null.
  """
  def describe_availability_monitor_test(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeAvailabilityMonitorTest", input, options)
  end

  @doc """
  Returns the bandwidth rate limits of a gateway.

  By default, these limits are not set, which means no bandwidth rate limiting is
  in effect. This operation is supported only for the stored volume, cached
  volume, and tape gateway types. To describe bandwidth rate limits for S3 file
  gateways, use `DescribeBandwidthRateLimitSchedule`.

  This operation returns a value for a bandwidth rate limit only if the limit is
  set. If no limits are set for the gateway, then this operation returns only the
  gateway ARN in the response body. To specify which gateway to describe, use the
  Amazon Resource Name (ARN) of the gateway in your request.
  """
  def describe_bandwidth_rate_limit(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeBandwidthRateLimit", input, options)
  end

  @doc """
  Returns information about the bandwidth rate limit schedule of a gateway.

  By default, gateways do not have bandwidth rate limit schedules, which means no
  bandwidth rate limiting is in effect. This operation is supported only for
  volume, tape and S3 file gateways. FSx file gateways do not support bandwidth
  rate limits.

  This operation returns information about a gateway's bandwidth rate limit
  schedule. A bandwidth rate limit schedule consists of one or more bandwidth rate
  limit intervals. A bandwidth rate limit interval defines a period of time on one
  or more days of the week, during which bandwidth rate limits are specified for
  uploading, downloading, or both.

  A bandwidth rate limit interval consists of one or more days of the week, a
  start hour and minute, an ending hour and minute, and bandwidth rate limits for
  uploading and downloading

  If no bandwidth rate limit schedule intervals are set for the gateway, this
  operation returns an empty response. To specify which gateway to describe, use
  the Amazon Resource Name (ARN) of the gateway in your request.
  """
  def describe_bandwidth_rate_limit_schedule(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeBandwidthRateLimitSchedule", input, options)
  end

  @doc """
  Returns information about the cache of a gateway.

  This operation is only supported in the cached volume, tape, and file gateway
  types.

  The response includes disk IDs that are configured as cache, and it includes the
  amount of cache allocated and used.
  """
  def describe_cache(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeCache", input, options)
  end

  @doc """
  Returns a description of the gateway volumes specified in the request.

  This operation is only supported in the cached volume gateway types.

  The list of gateway volumes in the request must be from one gateway. In the
  response, Storage Gateway returns volume information sorted by volume Amazon
  Resource Name (ARN).
  """
  def describe_cached_iscsi_volumes(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeCachediSCSIVolumes", input, options)
  end

  @doc """
  Returns an array of Challenge-Handshake Authentication Protocol (CHAP)
  credentials information for a specified iSCSI target, one for each
  target-initiator pair.

  This operation is supported in the volume and tape gateway types.
  """
  def describe_chap_credentials(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeChapCredentials", input, options)
  end

  @doc """
  Gets the file system association information.

  This operation is only supported for FSx File Gateways.
  """
  def describe_file_system_associations(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeFileSystemAssociations", input, options)
  end

  @doc """
  Returns metadata about a gateway such as its name, network interfaces, time
  zone, status, and software version.

  To specify which gateway to describe, use the Amazon Resource Name (ARN) of the
  gateway in your request.
  """
  def describe_gateway_information(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeGatewayInformation", input, options)
  end

  @doc """
  Returns your gateway's weekly maintenance start time including the day and time
  of the week.

  Note that values are in terms of the gateway's time zone.
  """
  def describe_maintenance_start_time(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeMaintenanceStartTime", input, options)
  end

  @doc """
  Gets a description for one or more Network File System (NFS) file shares from an
  S3 File Gateway.

  This operation is only supported for S3 File Gateways.
  """
  def describe_nfs_file_shares(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeNFSFileShares", input, options)
  end

  @doc """
  Gets a description for one or more Server Message Block (SMB) file shares from a
  S3 File Gateway.

  This operation is only supported for S3 File Gateways.
  """
  def describe_smb_file_shares(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeSMBFileShares", input, options)
  end

  @doc """
  Gets a description of a Server Message Block (SMB) file share settings from a
  file gateway.

  This operation is only supported for file gateways.
  """
  def describe_smb_settings(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeSMBSettings", input, options)
  end

  @doc """
  Describes the snapshot schedule for the specified gateway volume.

  The snapshot schedule information includes intervals at which snapshots are
  automatically initiated on the volume. This operation is only supported in the
  cached volume and stored volume types.
  """
  def describe_snapshot_schedule(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeSnapshotSchedule", input, options)
  end

  @doc """
  Returns the description of the gateway volumes specified in the request.

  The list of gateway volumes in the request must be from one gateway. In the
  response, Storage Gateway returns volume information sorted by volume ARNs. This
  operation is only supported in stored volume gateway type.
  """
  def describe_stored_iscsi_volumes(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeStorediSCSIVolumes", input, options)
  end

  @doc """
  Returns a description of specified virtual tapes in the virtual tape shelf
  (VTS).

  This operation is only supported in the tape gateway type.

  If a specific `TapeARN` is not specified, Storage Gateway returns a description
  of all virtual tapes found in the VTS associated with your account.
  """
  def describe_tape_archives(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeTapeArchives", input, options)
  end

  @doc """
  Returns a list of virtual tape recovery points that are available for the
  specified tape gateway.

  A recovery point is a point-in-time view of a virtual tape at which all the data
  on the virtual tape is consistent. If your gateway crashes, virtual tapes that
  have recovery points can be recovered to a new gateway. This operation is only
  supported in the tape gateway type.
  """
  def describe_tape_recovery_points(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeTapeRecoveryPoints", input, options)
  end

  @doc """
  Returns a description of the specified Amazon Resource Name (ARN) of virtual
  tapes.

  If a `TapeARN` is not specified, returns a description of all virtual tapes
  associated with the specified gateway. This operation is only supported in the
  tape gateway type.
  """
  def describe_tapes(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeTapes", input, options)
  end

  @doc """
  Returns information about the upload buffer of a gateway.

  This operation is supported for the stored volume, cached volume, and tape
  gateway types.

  The response includes disk IDs that are configured as upload buffer space, and
  it includes the amount of upload buffer space allocated and used.
  """
  def describe_upload_buffer(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeUploadBuffer", input, options)
  end

  @doc """
  Returns a description of virtual tape library (VTL) devices for the specified
  tape gateway.

  In the response, Storage Gateway returns VTL device information.

  This operation is only supported in the tape gateway type.
  """
  def describe_vtl_devices(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeVTLDevices", input, options)
  end

  @doc """
  Returns information about the working storage of a gateway.

  This operation is only supported in the stored volumes gateway type. This
  operation is deprecated in cached volumes API version (20120630). Use
  DescribeUploadBuffer instead.

  Working storage is also referred to as upload buffer. You can also use the
  DescribeUploadBuffer operation to add upload buffer to a stored volume gateway.

  The response includes disk IDs that are configured as working storage, and it
  includes the amount of working storage allocated and used.
  """
  def describe_working_storage(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeWorkingStorage", input, options)
  end

  @doc """
  Disconnects a volume from an iSCSI connection and then detaches the volume from
  the specified gateway.

  Detaching and attaching a volume enables you to recover your data from one
  gateway to a different gateway without creating a snapshot. It also makes it
  easier to move your volumes from an on-premises gateway to a gateway hosted on
  an Amazon EC2 instance. This operation is only supported in the volume gateway
  type.
  """
  def detach_volume(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DetachVolume", input, options)
  end

  @doc """
  Disables a tape gateway when the gateway is no longer functioning.

  For example, if your gateway VM is damaged, you can disable the gateway so you
  can recover virtual tapes.

  Use this operation for a tape gateway that is not reachable or not functioning.
  This operation is only supported in the tape gateway type.

  After a gateway is disabled, it cannot be enabled.
  """
  def disable_gateway(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DisableGateway", input, options)
  end

  @doc """
  Disassociates an Amazon FSx file system from the specified gateway.

  After the disassociation process finishes, the gateway can no longer access the
  Amazon FSx file system. This operation is only supported in the FSx File Gateway
  type.
  """
  def disassociate_file_system(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DisassociateFileSystem", input, options)
  end

  @doc """
  Adds a file gateway to an Active Directory domain.

  This operation is only supported for file gateways that support the SMB file
  protocol.

  Joining a domain creates an Active Directory computer account in the default
  organizational unit, using the gateway's **Gateway ID** as the account name (for
  example, SGW-1234ADE). If your Active Directory environment requires that you
  pre-stage accounts to facilitate the join domain process, you will need to
  create this account ahead of time.

  To create the gateway's computer account in an organizational unit other than
  the default, you must specify the organizational unit when joining the domain.
  """
  def join_domain(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "JoinDomain", input, options)
  end

  @doc """
  Lists the automatic tape creation policies for a gateway.

  If there are no automatic tape creation policies for the gateway, it returns an
  empty list.

  This operation is only supported for tape gateways.
  """
  def list_automatic_tape_creation_policies(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListAutomaticTapeCreationPolicies", input, options)
  end

  @doc """
  Gets a list of the file shares for a specific S3 File Gateway, or the list of
  file shares that belong to the calling Amazon Web Services account.

  This operation is only supported for S3 File Gateways.
  """
  def list_file_shares(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListFileShares", input, options)
  end

  @doc """
  Gets a list of `FileSystemAssociationSummary` objects.

  Each object contains a summary of a file system association. This operation is
  only supported for FSx File Gateways.
  """
  def list_file_system_associations(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListFileSystemAssociations", input, options)
  end

  @doc """
  Lists gateways owned by an Amazon Web Services account in an Amazon Web Services
  Region specified in the request.

  The returned list is ordered by gateway Amazon Resource Name (ARN).

  By default, the operation returns a maximum of 100 gateways. This operation
  supports pagination that allows you to optionally reduce the number of gateways
  returned in a response.

  If you have more gateways than are returned in a response (that is, the response
  returns only a truncated list of your gateways), the response contains a marker
  that you can specify in your next request to fetch the next page of gateways.
  """
  def list_gateways(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListGateways", input, options)
  end

  @doc """
  Returns a list of the gateway's local disks.

  To specify which gateway to describe, you use the Amazon Resource Name (ARN) of
  the gateway in the body of the request.

  The request returns a list of all disks, specifying which are configured as
  working storage, cache storage, or stored volume or not configured at all. The
  response includes a `DiskStatus` field. This field can have a value of present
  (the disk is available to use), missing (the disk is no longer connected to the
  gateway), or mismatch (the disk node is occupied by a disk that has incorrect
  metadata or the disk content is corrupted).
  """
  def list_local_disks(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListLocalDisks", input, options)
  end

  @doc """
  Lists the tags that have been added to the specified resource.

  This operation is supported in storage gateways of all types.
  """
  def list_tags_for_resource(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListTagsForResource", input, options)
  end

  @doc """
  Lists custom tape pools.

  You specify custom tape pools to list by specifying one or more custom tape pool
  Amazon Resource Names (ARNs). If you don't specify a custom tape pool ARN, the
  operation lists all custom tape pools.

  This operation supports pagination. You can optionally specify the `Limit`
  parameter in the body to limit the number of tape pools in the response. If the
  number of tape pools returned in the response is truncated, the response
  includes a `Marker` element that you can use in your subsequent request to
  retrieve the next set of tape pools.
  """
  def list_tape_pools(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListTapePools", input, options)
  end

  @doc """
  Lists virtual tapes in your virtual tape library (VTL) and your virtual tape
  shelf (VTS).

  You specify the tapes to list by specifying one or more tape Amazon Resource
  Names (ARNs). If you don't specify a tape ARN, the operation lists all virtual
  tapes in both your VTL and VTS.

  This operation supports pagination. By default, the operation returns a maximum
  of up to 100 tapes. You can optionally specify the `Limit` parameter in the body
  to limit the number of tapes in the response. If the number of tapes returned in
  the response is truncated, the response includes a `Marker` element that you can
  use in your subsequent request to retrieve the next set of tapes. This operation
  is only supported in the tape gateway type.
  """
  def list_tapes(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListTapes", input, options)
  end

  @doc """
  Lists iSCSI initiators that are connected to a volume.

  You can use this operation to determine whether a volume is being used or not.
  This operation is only supported in the cached volume and stored volume gateway
  types.
  """
  def list_volume_initiators(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListVolumeInitiators", input, options)
  end

  @doc """
  Lists the recovery points for a specified gateway.

  This operation is only supported in the cached volume gateway type.

  Each cache volume has one recovery point. A volume recovery point is a point in
  time at which all data of the volume is consistent and from which you can create
  a snapshot or clone a new cached volume from a source volume. To create a
  snapshot from a volume recovery point use the
  `CreateSnapshotFromVolumeRecoveryPoint` operation.
  """
  def list_volume_recovery_points(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListVolumeRecoveryPoints", input, options)
  end

  @doc """
  Lists the iSCSI stored volumes of a gateway.

  Results are sorted by volume ARN. The response includes only the volume ARNs. If
  you want additional volume information, use the `DescribeStorediSCSIVolumes` or
  the `DescribeCachediSCSIVolumes` API.

  The operation supports pagination. By default, the operation returns a maximum
  of up to 100 volumes. You can optionally specify the `Limit` field in the body
  to limit the number of volumes in the response. If the number of volumes
  returned in the response is truncated, the response includes a Marker field. You
  can use this Marker value in your subsequent request to retrieve the next set of
  volumes. This operation is only supported in the cached volume and stored volume
  gateway types.
  """
  def list_volumes(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListVolumes", input, options)
  end

  @doc """
  Sends you notification through CloudWatch Events when all files written to your
  file share have been uploaded to S3.

  Amazon S3.

  Storage Gateway can send a notification through Amazon CloudWatch Events when
  all files written to your file share up to that point in time have been uploaded
  to Amazon S3. These files include files written to the file share up to the time
  that you make a request for notification. When the upload is done, Storage
  Gateway sends you notification through an Amazon CloudWatch Event. You can
  configure CloudWatch Events to send the notification through event targets such
  as Amazon SNS or Lambda function. This operation is only supported for S3 File
  Gateways.

  For more information, see [Getting file upload notification](https://docs.aws.amazon.com/filegateway/latest/files3/monitoring-file-gateway.html#get-notification)
  in the *Amazon S3 File Gateway User Guide*.
  """
  def notify_when_uploaded(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "NotifyWhenUploaded", input, options)
  end

  @doc """
  Refreshes the cached inventory of objects for the specified file share.

  This operation finds objects in the Amazon S3 bucket that were added, removed,
  or replaced since the gateway last listed the bucket's contents and cached the
  results. This operation does not import files into the S3 File Gateway cache
  storage. It only updates the cached inventory to reflect changes in the
  inventory of the objects in the S3 bucket. This operation is only supported in
  the S3 File Gateway types.

  You can subscribe to be notified through an Amazon CloudWatch event when your
  `RefreshCache` operation completes. For more information, see [Getting notified about file
  operations](https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-notification)
  in the *Storage Gateway User Guide*. This operation is Only supported for S3
  File Gateways.

  When this API is called, it only initiates the refresh operation. When the API
  call completes and returns a success code, it doesn't necessarily mean that the
  file refresh has completed. You should use the refresh-complete notification to
  determine that the operation has completed before you check for new files on the
  gateway file share. You can subscribe to be notified through a CloudWatch event
  when your `RefreshCache` operation completes.

  Throttle limit: This API is asynchronous, so the gateway will accept no more
  than two refreshes at any time. We recommend using the refresh-complete
  CloudWatch event notification before issuing additional requests. For more
  information, see [Getting notified about file operations](https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-notification)
  in the *Storage Gateway User Guide*.

     Wait at least 60 seconds between consecutive RefreshCache API
  requests.

     If you invoke the RefreshCache API when two requests are already
  being processed, any new request will cause an `InvalidGatewayRequestException`
  error because too many requests were sent to the server.

  The S3 bucket name does not need to be included when entering the list of
  folders in the FolderList parameter.

  For more information, see [Getting notified about file operations](https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-notification)
  in the *Storage Gateway User Guide*.
  """
  def refresh_cache(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "RefreshCache", input, options)
  end

  @doc """
  Removes one or more tags from the specified resource.

  This operation is supported in storage gateways of all types.
  """
  def remove_tags_from_resource(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "RemoveTagsFromResource", input, options)
  end

  @doc """
  Resets all cache disks that have encountered an error and makes the disks
  available for reconfiguration as cache storage.

  If your cache disk encounters an error, the gateway prevents read and write
  operations on virtual tapes in the gateway. For example, an error can occur when
  a disk is corrupted or removed from the gateway. When a cache is reset, the
  gateway loses its cache storage. At this point, you can reconfigure the disks as
  cache disks. This operation is only supported in the cached volume and tape
  types.

  If the cache disk you are resetting contains data that has not been uploaded to
  Amazon S3 yet, that data can be lost. After you reset cache disks, there will be
  no configured cache disks left in the gateway, so you must configure at least
  one new cache disk for your gateway to function properly.
  """
  def reset_cache(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ResetCache", input, options)
  end

  @doc """
  Retrieves an archived virtual tape from the virtual tape shelf (VTS) to a tape
  gateway.

  Virtual tapes archived in the VTS are not associated with any gateway. However
  after a tape is retrieved, it is associated with a gateway, even though it is
  also listed in the VTS, that is, archive. This operation is only supported in
  the tape gateway type.

  Once a tape is successfully retrieved to a gateway, it cannot be retrieved again
  to another gateway. You must archive the tape again before you can retrieve it
  to another gateway. This operation is only supported in the tape gateway type.
  """
  def retrieve_tape_archive(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "RetrieveTapeArchive", input, options)
  end

  @doc """
  Retrieves the recovery point for the specified virtual tape.

  This operation is only supported in the tape gateway type.

  A recovery point is a point in time view of a virtual tape at which all the data
  on the tape is consistent. If your gateway crashes, virtual tapes that have
  recovery points can be recovered to a new gateway.

  The virtual tape can be retrieved to only one gateway. The retrieved tape is
  read-only. The virtual tape can be retrieved to only a tape gateway. There is no
  charge for retrieving recovery points.
  """
  def retrieve_tape_recovery_point(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "RetrieveTapeRecoveryPoint", input, options)
  end

  @doc """
  Sets the password for your VM local console.

  When you log in to the local console for the first time, you log in to the VM
  with the default credentials. We recommend that you set a new password. You
  don't need to know the default password to set a new password.
  """
  def set_local_console_password(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "SetLocalConsolePassword", input, options)
  end

  @doc """
  Sets the password for the guest user `smbguest`.

  The `smbguest` user is the user when the authentication method for the file
  share is set to `GuestAccess`. This operation only supported for S3 File
  Gateways
  """
  def set_smb_guest_password(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "SetSMBGuestPassword", input, options)
  end

  @doc """
  Shuts down a gateway.

  To specify which gateway to shut down, use the Amazon Resource Name (ARN) of the
  gateway in the body of your request.

  The operation shuts down the gateway service component running in the gateway's
  virtual machine (VM) and not the host VM.

  If you want to shut down the VM, it is recommended that you first shut down the
  gateway component in the VM to avoid unpredictable conditions.

  After the gateway is shutdown, you cannot call any other API except
  `StartGateway`, `DescribeGatewayInformation`, and `ListGateways`. For more
  information, see `ActivateGateway`. Your applications cannot read from or write
  to the gateway's storage volumes, and there are no snapshots taken.

  When you make a shutdown request, you will get a `200 OK` success response
  immediately. However, it might take some time for the gateway to shut down. You
  can call the `DescribeGatewayInformation` API to check the status. For more
  information, see `ActivateGateway`.

  If do not intend to use the gateway again, you must delete the gateway (using
  `DeleteGateway`) to no longer pay software charges associated with the gateway.
  """
  def shutdown_gateway(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ShutdownGateway", input, options)
  end

  @doc """
  Start a test that verifies that the specified gateway is configured for High
  Availability monitoring in your host environment.

  This request only initiates the test and that a successful response only
  indicates that the test was started. It doesn't indicate that the test passed.
  For the status of the test, invoke the `DescribeAvailabilityMonitorTest` API.

  Starting this test will cause your gateway to go offline for a brief period.
  """
  def start_availability_monitor_test(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "StartAvailabilityMonitorTest", input, options)
  end

  @doc """
  Starts a gateway that you previously shut down (see `ShutdownGateway`).

  After the gateway starts, you can then make other API calls, your applications
  can read from or write to the gateway's storage volumes and you will be able to
  take snapshot backups.

  When you make a request, you will get a 200 OK success response immediately.
  However, it might take some time for the gateway to be ready. You should call
  `DescribeGatewayInformation` and check the status before making any additional
  API calls. For more information, see `ActivateGateway`.

  To specify which gateway to start, use the Amazon Resource Name (ARN) of the
  gateway in your request.
  """
  def start_gateway(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "StartGateway", input, options)
  end

  @doc """
  Updates the automatic tape creation policy of a gateway.

  Use this to update the policy with a new set of automatic tape creation rules.
  This is only supported for tape gateways.

  By default, there is no automatic tape creation policy.

  A gateway can have only one automatic tape creation policy.
  """
  def update_automatic_tape_creation_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateAutomaticTapeCreationPolicy", input, options)
  end

  @doc """
  Updates the bandwidth rate limits of a gateway.

  You can update both the upload and download bandwidth rate limit or specify only
  one of the two. If you don't set a bandwidth rate limit, the existing rate limit
  remains. This operation is supported only for the stored volume, cached volume,
  and tape gateway types. To update bandwidth rate limits for S3 file gateways,
  use `UpdateBandwidthRateLimitSchedule`.

  By default, a gateway's bandwidth rate limits are not set. If you don't set any
  limit, the gateway does not have any limitations on its bandwidth usage and
  could potentially use the maximum available bandwidth.

  To specify which gateway to update, use the Amazon Resource Name (ARN) of the
  gateway in your request.
  """
  def update_bandwidth_rate_limit(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateBandwidthRateLimit", input, options)
  end

  @doc """
  Updates the bandwidth rate limit schedule for a specified gateway.

  By default, gateways do not have bandwidth rate limit schedules, which means no
  bandwidth rate limiting is in effect. Use this to initiate or update a gateway's
  bandwidth rate limit schedule. This operation is supported for volume, tape, and
  S3 file gateways. S3 file gateways support bandwidth rate limits for upload
  only. FSx file gateways do not support bandwidth rate limits.
  """
  def update_bandwidth_rate_limit_schedule(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateBandwidthRateLimitSchedule", input, options)
  end

  @doc """
  Updates the Challenge-Handshake Authentication Protocol (CHAP) credentials for a
  specified iSCSI target.

  By default, a gateway does not have CHAP enabled; however, for added security,
  you might use it. This operation is supported in the volume and tape gateway
  types.

  When you update CHAP credentials, all existing connections on the target are
  closed and initiators must reconnect with the new credentials.
  """
  def update_chap_credentials(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateChapCredentials", input, options)
  end

  @doc """
  Updates a file system association.

  This operation is only supported in the FSx File Gateways.
  """
  def update_file_system_association(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateFileSystemAssociation", input, options)
  end

  @doc """
  Updates a gateway's metadata, which includes the gateway's name and time zone.

  To specify which gateway to update, use the Amazon Resource Name (ARN) of the
  gateway in your request.

  For gateways activated after September 2, 2015, the gateway's ARN contains the
  gateway ID rather than the gateway name. However, changing the name of the
  gateway has no effect on the gateway's ARN.
  """
  def update_gateway_information(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateGatewayInformation", input, options)
  end

  @doc """
  Updates the gateway virtual machine (VM) software.

  The request immediately triggers the software update.

  When you make this request, you get a `200 OK` success response immediately.
  However, it might take some time for the update to complete. You can call
  `DescribeGatewayInformation` to verify the gateway is in the `STATE_RUNNING`
  state.

  A software update forces a system restart of your gateway. You can minimize the
  chance of any disruption to your applications by increasing your iSCSI
  Initiators' timeouts. For more information about increasing iSCSI Initiator
  timeouts for Windows and Linux, see [Customizing your Windows iSCSI settings](https://docs.aws.amazon.com/storagegateway/latest/userguide/ConfiguringiSCSIClientInitiatorWindowsClient.html#CustomizeWindowsiSCSISettings)
  and [Customizing your Linux iSCSI settings](https://docs.aws.amazon.com/storagegateway/latest/userguide/ConfiguringiSCSIClientInitiatorRedHatClient.html#CustomizeLinuxiSCSISettings),
  respectively.
  """
  def update_gateway_software_now(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateGatewaySoftwareNow", input, options)
  end

  @doc """
  Updates a gateway's weekly maintenance start time information, including day and
  time of the week.

  The maintenance time is the time in your gateway's time zone.
  """
  def update_maintenance_start_time(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateMaintenanceStartTime", input, options)
  end

  @doc """
  Updates a Network File System (NFS) file share.

  This operation is only supported in S3 File Gateways.

  To leave a file share field unchanged, set the corresponding input field to
  null.

  Updates the following file share settings:

    * Default storage class for your S3 bucket

    * Metadata defaults for your S3 bucket

    * Allowed NFS clients for your file share

    * Squash settings

    * Write status of your file share
  """
  def update_nfs_file_share(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateNFSFileShare", input, options)
  end

  @doc """
  Updates a Server Message Block (SMB) file share.

  This operation is only supported for S3 File Gateways.

  To leave a file share field unchanged, set the corresponding input field to
  null.

  File gateways require Security Token Service (Amazon Web Services STS) to be
  activated to enable you to create a file share. Make sure that Amazon Web
  Services STS is activated in the Amazon Web Services Region you are creating
  your file gateway in. If Amazon Web Services STS is not activated in this Amazon
  Web Services Region, activate it. For information about how to activate Amazon
  Web Services STS, see [Activating and deactivating Amazon Web Services STS in an Amazon Web Services
  Region](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html)
  in the *Identity and Access Management User Guide*.

  File gateways don't support creating hard or symbolic links on a file share.
  """
  def update_smb_file_share(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateSMBFileShare", input, options)
  end

  @doc """
  Controls whether the shares on an S3 File Gateway are visible in a net view or
  browse list.

  The operation is only supported for S3 File Gateways.
  """
  def update_smb_file_share_visibility(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateSMBFileShareVisibility", input, options)
  end

  @doc """
  Updates the list of Active Directory users and groups that have special
  permissions for SMB file shares on the gateway.
  """
  def update_smb_local_groups(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateSMBLocalGroups", input, options)
  end

  @doc """
  Updates the SMB security strategy on a file gateway.

  This action is only supported in file gateways.

  This API is called Security level in the User Guide.

  A higher security level can affect performance of the gateway.
  """
  def update_smb_security_strategy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateSMBSecurityStrategy", input, options)
  end

  @doc """
  Updates a snapshot schedule configured for a gateway volume.

  This operation is only supported in the cached volume and stored volume gateway
  types.

  The default snapshot schedule for volume is once every 24 hours, starting at the
  creation time of the volume. You can use this API to change the snapshot
  schedule configured for the volume.

  In the request you must identify the gateway volume whose snapshot schedule you
  want to update, and the schedule information, including when you want the
  snapshot to begin on a day and the frequency (in hours) of snapshots.
  """
  def update_snapshot_schedule(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateSnapshotSchedule", input, options)
  end

  @doc """
  Updates the type of medium changer in a tape gateway.

  When you activate a tape gateway, you select a medium changer type for the tape
  gateway. This operation enables you to select a different type of medium changer
  after a tape gateway is activated. This operation is only supported in the tape
  gateway type.
  """
  def update_vtl_device_type(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateVTLDeviceType", input, options)
  end
end
