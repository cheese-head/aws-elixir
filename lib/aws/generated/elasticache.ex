# WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
# See https://github.com/aws-beam/aws-codegen for more details.

defmodule AWS.ElastiCache do
  @moduledoc """
  Amazon ElastiCache

  Amazon ElastiCache is a web service that makes it easier to set up, operate, and
  scale a distributed cache in the cloud.

  With ElastiCache, customers get all of the benefits of a high-performance,
  in-memory cache with less of the administrative burden involved in launching and
  managing a distributed cache. The service makes setup, scaling, and cluster
  failure handling much simpler than in a self-managed cache deployment.

  In addition, through integration with Amazon CloudWatch, customers get enhanced
  visibility into the key performance statistics associated with their cache and
  can receive alarms if a part of their cache runs hot.
  """

  alias AWS.Client
  alias AWS.Request

  def metadata do
    %{
      abbreviation: nil,
      api_version: "2015-02-02",
      content_type: "application/x-www-form-urlencoded",
      credential_scope: nil,
      endpoint_prefix: "elasticache",
      global?: false,
      protocol: "query",
      service_id: "ElastiCache",
      signature_version: "v4",
      signing_name: "elasticache",
      target_prefix: nil
    }
  end

  @doc """
  A tag is a key-value pair where the key and value are case-sensitive.

  You can use tags to categorize and track all your ElastiCache resources, with
  the exception of global replication group. When you add or remove tags on
  replication groups, those actions will be replicated to all nodes in the
  replication group. For more information, see [Resource-level permissions](http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/IAM.ResourceLevelPermissions.html).

  For example, you can use cost-allocation tags to your ElastiCache resources,
  Amazon generates a cost allocation report as a comma-separated value (CSV) file
  with your usage and costs aggregated by your tags. You can apply tags that
  represent business categories (such as cost centers, application names, or
  owners) to organize your costs across multiple services.

  For more information, see [Using Cost Allocation Tags in Amazon ElastiCache](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Tagging.html)
  in the *ElastiCache User Guide*.
  """
  def add_tags_to_resource(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "AddTagsToResource", input, options)
  end

  @doc """
  Allows network ingress to a cache security group.

  Applications using ElastiCache must be running on Amazon EC2, and Amazon EC2
  security groups are used as the authorization mechanism.

  You cannot authorize ingress from an Amazon EC2 security group in one region to
  an ElastiCache cluster in another region.
  """
  def authorize_cache_security_group_ingress(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "AuthorizeCacheSecurityGroupIngress", input, options)
  end

  @doc """
  Apply the service update.

  For more information on service updates and applying them, see [Applying Service Updates](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/applying-updates.html).
  """
  def batch_apply_update_action(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "BatchApplyUpdateAction", input, options)
  end

  @doc """
  Stop the service update.

  For more information on service updates and stopping them, see [Stopping Service Updates](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/stopping-self-service-updates.html).
  """
  def batch_stop_update_action(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "BatchStopUpdateAction", input, options)
  end

  @doc """
  Complete the migration of data.
  """
  def complete_migration(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CompleteMigration", input, options)
  end

  @doc """
  Creates a copy of an existing serverless cache’s snapshot.

  Available for Redis only.
  """
  def copy_serverless_cache_snapshot(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CopyServerlessCacheSnapshot", input, options)
  end

  @doc """
  Makes a copy of an existing snapshot.

  This operation is valid for Redis only.

  Users or groups that have permissions to use the `CopySnapshot` operation can
  create their own Amazon S3 buckets and copy snapshots to it. To control access
  to your snapshots, use an IAM policy to control who has the ability to use the
  `CopySnapshot` operation. For more information about using IAM to control the
  use of ElastiCache operations, see [Exporting Snapshots](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html)
  and [Authentication & Access Control](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/IAM.html).

  You could receive the following error messages.

  ## Error Messages

    * **Error Message:** The S3 bucket %s is outside of the region.

  **Solution:** Create an Amazon S3 bucket in the same region as your snapshot.
  For more information, see [Step 1: Create an Amazon S3 Bucket](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-create-s3-bucket)
  in the ElastiCache User Guide.

    * **Error Message:** The S3 bucket %s does not exist.

  **Solution:** Create an Amazon S3 bucket in the same region as your snapshot.
  For more information, see [Step 1: Create an Amazon S3 Bucket](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-create-s3-bucket)
  in the ElastiCache User Guide.

    * **Error Message:** The S3 bucket %s is not owned by the
  authenticated user.

  **Solution:** Create an Amazon S3 bucket in the same region as your snapshot.
  For more information, see [Step 1: Create an Amazon S3 Bucket](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-create-s3-bucket)
  in the ElastiCache User Guide.

    * **Error Message:** The authenticated user does not have sufficient
  permissions to perform the desired activity.

  **Solution:** Contact your system administrator to get the needed permissions.

    * **Error Message:** The S3 bucket %s already contains an object
  with key %s.

  **Solution:** Give the `TargetSnapshotName` a new and unique value. If exporting
  a snapshot, you could alternatively create a new Amazon S3 bucket and use this
  same value for `TargetSnapshotName`.

    * **Error Message: ** ElastiCache has not been granted READ
  permissions %s on the S3 Bucket.

  **Solution:** Add List and Read permissions on the bucket. For more information,
  see [Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access)
  in the ElastiCache User Guide.

    * **Error Message: ** ElastiCache has not been granted WRITE
  permissions %s on the S3 Bucket.

  **Solution:** Add Upload/Delete permissions on the bucket. For more information,
  see [Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access)
  in the ElastiCache User Guide.

    * **Error Message: ** ElastiCache has not been granted READ_ACP
  permissions %s on the S3 Bucket.

  **Solution:** Add View Permissions on the bucket. For more information, see
  [Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access)
  in the ElastiCache User Guide.
  """
  def copy_snapshot(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CopySnapshot", input, options)
  end

  @doc """
  Creates a cluster.

  All nodes in the cluster run the same protocol-compliant cache engine software,
  either Memcached or Redis.

  This operation is not supported for Redis (cluster mode enabled) clusters.
  """
  def create_cache_cluster(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateCacheCluster", input, options)
  end

  @doc """
  Creates a new Amazon ElastiCache cache parameter group.

  An ElastiCache cache parameter group is a collection of parameters and their
  values that are applied to all of the nodes in any cluster or replication group
  using the CacheParameterGroup.

  A newly created CacheParameterGroup is an exact duplicate of the default
  parameter group for the CacheParameterGroupFamily. To customize the newly
  created CacheParameterGroup you can change the values of specific parameters.
  For more information, see:

    *
  [ModifyCacheParameterGroup](https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_ModifyCacheParameterGroup.html) in the ElastiCache API Reference.

    * [Parameters and Parameter
  Groups](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/ParameterGroups.html)
  in the ElastiCache User Guide.
  """
  def create_cache_parameter_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateCacheParameterGroup", input, options)
  end

  @doc """
  Creates a new cache security group.

  Use a cache security group to control access to one or more clusters.

  Cache security groups are only used when you are creating a cluster outside of
  an Amazon Virtual Private Cloud (Amazon VPC). If you are creating a cluster
  inside of a VPC, use a cache subnet group instead. For more information, see
  [CreateCacheSubnetGroup](https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_CreateCacheSubnetGroup.html).
  """
  def create_cache_security_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateCacheSecurityGroup", input, options)
  end

  @doc """
  Creates a new cache subnet group.

  Use this parameter only when you are creating a cluster in an Amazon Virtual
  Private Cloud (Amazon VPC).
  """
  def create_cache_subnet_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateCacheSubnetGroup", input, options)
  end

  @doc """
  Global Datastore for Redis offers fully managed, fast, reliable and secure
  cross-region replication.

  Using Global Datastore for Redis, you can create cross-region read replica
  clusters for ElastiCache for Redis to enable low-latency reads and disaster
  recovery across regions. For more information, see [Replication Across Regions Using Global
  Datastore](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Redis-Global-Datastore.html).

    * The **GlobalReplicationGroupIdSuffix** is the name of the Global
  datastore.

    * The **PrimaryReplicationGroupId** represents the name of the
  primary cluster that accepts writes and will replicate updates to the secondary
  cluster.
  """
  def create_global_replication_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateGlobalReplicationGroup", input, options)
  end

  @doc """
  Creates a Redis (cluster mode disabled) or a Redis (cluster mode enabled)
  replication group.

  This API can be used to create a standalone regional replication group or a
  secondary replication group associated with a Global datastore.

  A Redis (cluster mode disabled) replication group is a collection of clusters,
  where one of the clusters is a read/write primary and the others are read-only
  replicas. Writes to the primary are asynchronously propagated to the replicas.

  A Redis cluster-mode enabled cluster is comprised of from 1 to 90 shards
  (API/CLI: node groups). Each shard has a primary node and up to 5 read-only
  replica nodes. The configuration can range from 90 shards and 0 replicas to 15
  shards and 5 replicas, which is the maximum number or replicas allowed.

  The node or shard limit can be increased to a maximum of 500 per cluster if the
  Redis engine version is 5.0.6 or higher. For example, you can choose to
  configure a 500 node cluster that ranges between 83 shards (one primary and 5
  replicas per shard) and 500 shards (single primary and no replicas). Make sure
  there are enough available IP addresses to accommodate the increase. Common
  pitfalls include the subnets in the subnet group have too small a CIDR range or
  the subnets are shared and heavily used by other clusters. For more information,
  see [Creating a Subnet Group](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SubnetGroups.Creating.html).
  For versions below 5.0.6, the limit is 250 per cluster.

  To request a limit increase, see [Amazon Service Limits](https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html)
  and choose the limit type **Nodes per cluster per instance type**.

  When a Redis (cluster mode disabled) replication group has been successfully
  created, you can add one or more read replicas to it, up to a total of 5 read
  replicas. If you need to increase or decrease the number of node groups
  (console: shards), you can avail yourself of ElastiCache for Redis' scaling. For
  more information, see [Scaling ElastiCache for Redis Clusters](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Scaling.html)
  in the *ElastiCache User Guide*.

  This operation is valid for Redis only.
  """
  def create_replication_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateReplicationGroup", input, options)
  end

  @doc """
  Creates a serverless cache.
  """
  def create_serverless_cache(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateServerlessCache", input, options)
  end

  @doc """
  This API creates a copy of an entire ServerlessCache at a specific moment in
  time.

  Available for Redis only.
  """
  def create_serverless_cache_snapshot(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateServerlessCacheSnapshot", input, options)
  end

  @doc """
  Creates a copy of an entire cluster or replication group at a specific moment in
  time.

  This operation is valid for Redis only.
  """
  def create_snapshot(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateSnapshot", input, options)
  end

  @doc """
  For Redis engine version 6.0 onwards: Creates a Redis user.

  For more information, see [Using Role Based Access Control (RBAC)](http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.RBAC.html).
  """
  def create_user(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateUser", input, options)
  end

  @doc """
  For Redis engine version 6.0 onwards: Creates a Redis user group.

  For more information, see [Using Role Based Access Control (RBAC)](http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.RBAC.html)
  """
  def create_user_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateUserGroup", input, options)
  end

  @doc """
  Decreases the number of node groups in a Global datastore
  """
  def decrease_node_groups_in_global_replication_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(
      client,
      meta,
      "DecreaseNodeGroupsInGlobalReplicationGroup",
      input,
      options
    )
  end

  @doc """
  Dynamically decreases the number of replicas in a Redis (cluster mode disabled)
  replication group or the number of replica nodes in one or more node groups
  (shards) of a Redis (cluster mode enabled) replication group.

  This operation is performed with no cluster down time.
  """
  def decrease_replica_count(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DecreaseReplicaCount", input, options)
  end

  @doc """
  Deletes a previously provisioned cluster.

  `DeleteCacheCluster` deletes all associated cache nodes, node endpoints and the
  cluster itself. When you receive a successful response from this operation,
  Amazon ElastiCache immediately begins deleting the cluster; you cannot cancel or
  revert this operation.

  This operation is not valid for:

    * Redis (cluster mode enabled) clusters

    * Redis (cluster mode disabled) clusters

    * A cluster that is the last read replica of a replication group

    * A cluster that is the primary node of a replication group

    * A node group (shard) that has Multi-AZ mode enabled

    * A cluster from a Redis (cluster mode enabled) replication group

    * A cluster that is not in the `available` state
  """
  def delete_cache_cluster(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteCacheCluster", input, options)
  end

  @doc """
  Deletes the specified cache parameter group.

  You cannot delete a cache parameter group if it is associated with any cache
  clusters. You cannot delete the default cache parameter groups in your account.
  """
  def delete_cache_parameter_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteCacheParameterGroup", input, options)
  end

  @doc """
  Deletes a cache security group.

  You cannot delete a cache security group if it is associated with any clusters.
  """
  def delete_cache_security_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteCacheSecurityGroup", input, options)
  end

  @doc """
  Deletes a cache subnet group.

  You cannot delete a default cache subnet group or one that is associated with
  any clusters.
  """
  def delete_cache_subnet_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteCacheSubnetGroup", input, options)
  end

  @doc """
  Deleting a Global datastore is a two-step process:

    * First, you must `DisassociateGlobalReplicationGroup` to remove the
  secondary clusters in the Global datastore.

    * Once the Global datastore contains only the primary cluster, you
  can use the `DeleteGlobalReplicationGroup` API to delete the Global datastore
  while retainining the primary cluster using
  `RetainPrimaryReplicationGroup=true`.

  Since the Global Datastore has only a primary cluster, you can delete the Global
  Datastore while retaining the primary by setting
  `RetainPrimaryReplicationGroup=true`. The primary cluster is never deleted when
  deleting a Global Datastore. It can only be deleted when it no longer is
  associated with any Global Datastore.

  When you receive a successful response from this operation, Amazon ElastiCache
  immediately begins deleting the selected resources; you cannot cancel or revert
  this operation.
  """
  def delete_global_replication_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteGlobalReplicationGroup", input, options)
  end

  @doc """
  Deletes an existing replication group.

  By default, this operation deletes the entire replication group, including the
  primary/primaries and all of the read replicas. If the replication group has
  only one primary, you can optionally delete only the read replicas, while
  retaining the primary by setting `RetainPrimaryCluster=true`.

  When you receive a successful response from this operation, Amazon ElastiCache
  immediately begins deleting the selected resources; you cannot cancel or revert
  this operation.

  This operation is valid for Redis only.
  """
  def delete_replication_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteReplicationGroup", input, options)
  end

  @doc """
  Deletes a specified existing serverless cache.
  """
  def delete_serverless_cache(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteServerlessCache", input, options)
  end

  @doc """
  Deletes an existing serverless cache snapshot.

  Available for Redis only.
  """
  def delete_serverless_cache_snapshot(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteServerlessCacheSnapshot", input, options)
  end

  @doc """
  Deletes an existing snapshot.

  When you receive a successful response from this operation, ElastiCache
  immediately begins deleting the snapshot; you cannot cancel or revert this
  operation.

  This operation is valid for Redis only.
  """
  def delete_snapshot(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteSnapshot", input, options)
  end

  @doc """
  For Redis engine version 6.0 onwards: Deletes a user.

  The user will be removed from all user groups and in turn removed from all
  replication groups. For more information, see [Using Role Based Access Control (RBAC)](http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.RBAC.html).
  """
  def delete_user(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteUser", input, options)
  end

  @doc """
  For Redis engine version 6.0 onwards: Deletes a user group.

  The user group must first be disassociated from the replication group before it
  can be deleted. For more information, see [Using Role Based Access Control (RBAC)](http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.RBAC.html).
  """
  def delete_user_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteUserGroup", input, options)
  end

  @doc """
  Returns information about all provisioned clusters if no cluster identifier is
  specified, or about a specific cache cluster if a cluster identifier is
  supplied.

  By default, abbreviated information about the clusters is returned. You can use
  the optional *ShowCacheNodeInfo* flag to retrieve detailed information about the
  cache nodes associated with the clusters. These details include the DNS address
  and port for the cache node endpoint.

  If the cluster is in the *creating* state, only cluster-level information is
  displayed until all of the nodes are successfully provisioned.

  If the cluster is in the *deleting* state, only cluster-level information is
  displayed.

  If cache nodes are currently being added to the cluster, node endpoint
  information and creation time for the additional nodes are not displayed until
  they are completely provisioned. When the cluster state is *available*, the
  cluster is ready for use.

  If cache nodes are currently being removed from the cluster, no endpoint
  information for the removed nodes is displayed.
  """
  def describe_cache_clusters(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeCacheClusters", input, options)
  end

  @doc """
  Returns a list of the available cache engines and their versions.
  """
  def describe_cache_engine_versions(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeCacheEngineVersions", input, options)
  end

  @doc """
  Returns a list of cache parameter group descriptions.

  If a cache parameter group name is specified, the list contains only the
  descriptions for that group.
  """
  def describe_cache_parameter_groups(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeCacheParameterGroups", input, options)
  end

  @doc """
  Returns the detailed parameter list for a particular cache parameter group.
  """
  def describe_cache_parameters(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeCacheParameters", input, options)
  end

  @doc """
  Returns a list of cache security group descriptions.

  If a cache security group name is specified, the list contains only the
  description of that group. This applicable only when you have ElastiCache in
  Classic setup
  """
  def describe_cache_security_groups(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeCacheSecurityGroups", input, options)
  end

  @doc """
  Returns a list of cache subnet group descriptions.

  If a subnet group name is specified, the list contains only the description of
  that group. This is applicable only when you have ElastiCache in VPC setup. All
  ElastiCache clusters now launch in VPC by default.
  """
  def describe_cache_subnet_groups(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeCacheSubnetGroups", input, options)
  end

  @doc """
  Returns the default engine and system parameter information for the specified
  cache engine.
  """
  def describe_engine_default_parameters(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeEngineDefaultParameters", input, options)
  end

  @doc """
  Returns events related to clusters, cache security groups, and cache parameter
  groups.

  You can obtain events specific to a particular cluster, cache security group, or
  cache parameter group by providing the name as a parameter.

  By default, only the events occurring within the last hour are returned;
  however, you can retrieve up to 14 days' worth of events if necessary.
  """
  def describe_events(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeEvents", input, options)
  end

  @doc """
  Returns information about a particular global replication group.

  If no identifier is specified, returns information about all Global datastores.
  """
  def describe_global_replication_groups(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeGlobalReplicationGroups", input, options)
  end

  @doc """
  Returns information about a particular replication group.

  If no identifier is specified, `DescribeReplicationGroups` returns information
  about all replication groups.

  This operation is valid for Redis only.
  """
  def describe_replication_groups(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeReplicationGroups", input, options)
  end

  @doc """
  Returns information about reserved cache nodes for this account, or about a
  specified reserved cache node.
  """
  def describe_reserved_cache_nodes(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeReservedCacheNodes", input, options)
  end

  @doc """
  Lists available reserved cache node offerings.
  """
  def describe_reserved_cache_nodes_offerings(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeReservedCacheNodesOfferings", input, options)
  end

  @doc """
  Returns information about serverless cache snapshots.

  By default, this API lists all of the customer’s serverless cache snapshots. It
  can also describe a single serverless cache snapshot, or the snapshots
  associated with a particular serverless cache. Available for Redis only.
  """
  def describe_serverless_cache_snapshots(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeServerlessCacheSnapshots", input, options)
  end

  @doc """
  Returns information about a specific serverless cache.

  If no identifier is specified, then the API returns information on all the
  serverless caches belonging to this Amazon Web Services account.
  """
  def describe_serverless_caches(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeServerlessCaches", input, options)
  end

  @doc """
  Returns details of the service updates
  """
  def describe_service_updates(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeServiceUpdates", input, options)
  end

  @doc """
  Returns information about cluster or replication group snapshots.

  By default, `DescribeSnapshots` lists all of your snapshots; it can optionally
  describe a single snapshot, or just the snapshots associated with a particular
  cache cluster.

  This operation is valid for Redis only.
  """
  def describe_snapshots(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeSnapshots", input, options)
  end

  @doc """
  Returns details of the update actions
  """
  def describe_update_actions(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeUpdateActions", input, options)
  end

  @doc """
  Returns a list of user groups.
  """
  def describe_user_groups(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeUserGroups", input, options)
  end

  @doc """
  Returns a list of users.
  """
  def describe_users(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeUsers", input, options)
  end

  @doc """
  Remove a secondary cluster from the Global datastore using the Global datastore
  name.

  The secondary cluster will no longer receive updates from the primary cluster,
  but will remain as a standalone cluster in that Amazon region.
  """
  def disassociate_global_replication_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DisassociateGlobalReplicationGroup", input, options)
  end

  @doc """
  Provides the functionality to export the serverless cache snapshot data to
  Amazon S3.

  Available for Redis only.
  """
  def export_serverless_cache_snapshot(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ExportServerlessCacheSnapshot", input, options)
  end

  @doc """
  Used to failover the primary region to a secondary region.

  The secondary region will become primary, and all other clusters will become
  secondary.
  """
  def failover_global_replication_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "FailoverGlobalReplicationGroup", input, options)
  end

  @doc """
  Increase the number of node groups in the Global datastore
  """
  def increase_node_groups_in_global_replication_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(
      client,
      meta,
      "IncreaseNodeGroupsInGlobalReplicationGroup",
      input,
      options
    )
  end

  @doc """
  Dynamically increases the number of replicas in a Redis (cluster mode disabled)
  replication group or the number of replica nodes in one or more node groups
  (shards) of a Redis (cluster mode enabled) replication group.

  This operation is performed with no cluster down time.
  """
  def increase_replica_count(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "IncreaseReplicaCount", input, options)
  end

  @doc """
  Lists all available node types that you can scale your Redis cluster's or
  replication group's current node type.

  When you use the `ModifyCacheCluster` or `ModifyReplicationGroup` operations to
  scale your cluster or replication group, the value of the `CacheNodeType`
  parameter must be one of the node types returned by this operation.
  """
  def list_allowed_node_type_modifications(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListAllowedNodeTypeModifications", input, options)
  end

  @doc """
  Lists all tags currently on a named resource.

  A tag is a key-value pair where the key and value are case-sensitive. You can
  use tags to categorize and track all your ElastiCache resources, with the
  exception of global replication group. When you add or remove tags on
  replication groups, those actions will be replicated to all nodes in the
  replication group. For more information, see [Resource-level permissions](http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/IAM.ResourceLevelPermissions.html).

  If the cluster is not in the *available* state, `ListTagsForResource` returns an
  error.
  """
  def list_tags_for_resource(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListTagsForResource", input, options)
  end

  @doc """
  Modifies the settings for a cluster.

  You can use this operation to change one or more cluster configuration
  parameters by specifying the parameters and the new values.
  """
  def modify_cache_cluster(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ModifyCacheCluster", input, options)
  end

  @doc """
  Modifies the parameters of a cache parameter group.

  You can modify up to 20 parameters in a single request by submitting a list
  parameter name and value pairs.
  """
  def modify_cache_parameter_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ModifyCacheParameterGroup", input, options)
  end

  @doc """
  Modifies an existing cache subnet group.
  """
  def modify_cache_subnet_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ModifyCacheSubnetGroup", input, options)
  end

  @doc """
  Modifies the settings for a Global datastore.
  """
  def modify_global_replication_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ModifyGlobalReplicationGroup", input, options)
  end

  @doc """
  Modifies the settings for a replication group.

  This is limited to Redis 7 and newer.

    * [Scaling for Amazon ElastiCache for Redis (cluster mode enabled)](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/scaling-redis-cluster-mode-enabled.html)
  in the ElastiCache User Guide

    *
  [ModifyReplicationGroupShardConfiguration](https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_ModifyReplicationGroupShardConfiguration.html)
  in the ElastiCache API Reference

  This operation is valid for Redis only.
  """
  def modify_replication_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ModifyReplicationGroup", input, options)
  end

  @doc """
  Modifies a replication group's shards (node groups) by allowing you to add
  shards, remove shards, or rebalance the keyspaces among existing shards.
  """
  def modify_replication_group_shard_configuration(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ModifyReplicationGroupShardConfiguration", input, options)
  end

  @doc """
  This API modifies the attributes of a serverless cache.
  """
  def modify_serverless_cache(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ModifyServerlessCache", input, options)
  end

  @doc """
  Changes user password(s) and/or access string.
  """
  def modify_user(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ModifyUser", input, options)
  end

  @doc """
  Changes the list of users that belong to the user group.
  """
  def modify_user_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ModifyUserGroup", input, options)
  end

  @doc """
  Allows you to purchase a reserved cache node offering.

  Reserved nodes are not eligible for cancellation and are non-refundable. For
  more information, see [Managing Costs with Reserved Nodes](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/reserved-nodes.html)
  for Redis or [Managing Costs with Reserved Nodes](https://docs.aws.amazon.com/AmazonElastiCache/latest/mem-ug/reserved-nodes.html)
  for Memcached.
  """
  def purchase_reserved_cache_nodes_offering(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "PurchaseReservedCacheNodesOffering", input, options)
  end

  @doc """
  Redistribute slots to ensure uniform distribution across existing shards in the
  cluster.
  """
  def rebalance_slots_in_global_replication_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "RebalanceSlotsInGlobalReplicationGroup", input, options)
  end

  @doc """
  Reboots some, or all, of the cache nodes within a provisioned cluster.

  This operation applies any modified cache parameter groups to the cluster. The
  reboot operation takes place as soon as possible, and results in a momentary
  outage to the cluster. During the reboot, the cluster status is set to
  REBOOTING.

  The reboot causes the contents of the cache (for each cache node being rebooted)
  to be lost.

  When the reboot is complete, a cluster event is created.

  Rebooting a cluster is currently supported on Memcached and Redis (cluster mode
  disabled) clusters. Rebooting is not supported on Redis (cluster mode enabled)
  clusters.

  If you make changes to parameters that require a Redis (cluster mode enabled)
  cluster reboot for the changes to be applied, see [Rebooting a Cluster](http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/nodes.rebooting.html)
  for an alternate process.
  """
  def reboot_cache_cluster(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "RebootCacheCluster", input, options)
  end

  @doc """
  Removes the tags identified by the `TagKeys` list from the named resource.

  A tag is a key-value pair where the key and value are case-sensitive. You can
  use tags to categorize and track all your ElastiCache resources, with the
  exception of global replication group. When you add or remove tags on
  replication groups, those actions will be replicated to all nodes in the
  replication group. For more information, see [Resource-level permissions](http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/IAM.ResourceLevelPermissions.html).
  """
  def remove_tags_from_resource(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "RemoveTagsFromResource", input, options)
  end

  @doc """
  Modifies the parameters of a cache parameter group to the engine or system
  default value.

  You can reset specific parameters by submitting a list of parameter names. To
  reset the entire cache parameter group, specify the `ResetAllParameters` and
  `CacheParameterGroupName` parameters.
  """
  def reset_cache_parameter_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ResetCacheParameterGroup", input, options)
  end

  @doc """
  Revokes ingress from a cache security group.

  Use this operation to disallow access from an Amazon EC2 security group that had
  been previously authorized.
  """
  def revoke_cache_security_group_ingress(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "RevokeCacheSecurityGroupIngress", input, options)
  end

  @doc """
  Start the migration of data.
  """
  def start_migration(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "StartMigration", input, options)
  end

  @doc """
  Represents the input of a `TestFailover` operation which test automatic failover
  on a specified node group (called shard in the console) in a replication group
  (called cluster in the console).

  This API is designed for testing the behavior of your application in case of
  ElastiCache failover. It is not designed to be an operational tool for
  initiating a failover to overcome a problem you may have with the cluster.
  Moreover, in certain conditions such as large-scale operational events, Amazon
  may block this API.

  ## Note the following

    * A customer can use this operation to test automatic failover on up
  to 5 shards (called node groups in the ElastiCache API and Amazon CLI) in any
  rolling 24-hour period.

    * If calling this operation on shards in different clusters (called
  replication groups in the API and CLI), the calls can be made concurrently.

    * If calling this operation multiple times on different shards in
  the same Redis (cluster mode enabled) replication group, the first node
  replacement must complete before a subsequent call can be made.

    * To determine whether the node replacement is complete you can
  check Events using the Amazon ElastiCache console, the Amazon CLI, or the
  ElastiCache API. Look for the following automatic failover related events,
  listed here in order of occurrance:

      1. Replication group message: `Test Failover API called
  for node group <node-group-id>`

      2. Cache cluster message: `Failover from primary node
  <primary-node-id> to replica node <node-id> completed`

      3. Replication group message: `Failover from primary
  node <primary-node-id> to replica node <node-id> completed`

      4. Cache cluster message: `Recovering cache nodes
  <node-id>`

      5. Cache cluster message: `Finished recovery for cache
  nodes <node-id>`

  For more information see:

      * [Viewing ElastiCache Events](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/ECEvents.Viewing.html)
  in the *ElastiCache User Guide*

      *
  [DescribeEvents](https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_DescribeEvents.html) in the ElastiCache API Reference

  Also see, [Testing Multi-AZ
  ](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/AutoFailover.html#auto-failover-test)
  in the *ElastiCache User Guide*.
  """
  def test_failover(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "TestFailover", input, options)
  end

  @doc """
  Async API to test connection between source and target replication group.
  """
  def test_migration(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "TestMigration", input, options)
  end
end
