# WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
# See https://github.com/aws-beam/aws-codegen for more details.

defmodule AWS.SecretsManager do
  @moduledoc """
  Amazon Web Services Secrets Manager

  Amazon Web Services Secrets Manager provides a service to enable you to store,
  manage, and retrieve, secrets.

  This guide provides descriptions of the Secrets Manager API. For more
  information about using this service, see the [Amazon Web Services Secrets Manager User
  Guide](https://docs.aws.amazon.com/secretsmanager/latest/userguide/introduction.html).

  ## API Version

  This version of the Secrets Manager API Reference documents the Secrets Manager
  API version 2017-10-17.

  For a list of endpoints, see [Amazon Web Services Secrets Manager endpoints](https://docs.aws.amazon.com/secretsmanager/latest/userguide/asm_access.html#endpoints).

  ## Support and Feedback for Amazon Web Services Secrets Manager

  We welcome your feedback. Send your comments to
  [awssecretsmanager-feedback@amazon.com](mailto:awssecretsmanager-feedback@amazon.com), or post your feedback and questions in the [Amazon Web Services Secrets Manager
  Discussion Forum](http://forums.aws.amazon.com/forum.jspa?forumID=296). For more
  information about the Amazon Web Services Discussion Forums, see [Forums Help](http://forums.aws.amazon.com/help.jspa).

  ## Logging API Requests

  Amazon Web Services Secrets Manager supports Amazon Web Services CloudTrail, a
  service that records Amazon Web Services API calls for your Amazon Web Services
  account and delivers log files to an Amazon S3 bucket. By using information
  that's collected by Amazon Web Services CloudTrail, you can determine the
  requests successfully made to Secrets Manager, who made the request, when it was
  made, and so on. For more about Amazon Web Services Secrets Manager and support
  for Amazon Web Services CloudTrail, see [Logging Amazon Web Services Secrets Manager Events with Amazon Web Services
  CloudTrail](https://docs.aws.amazon.com/secretsmanager/latest/userguide/monitoring.html#monitoring_cloudtrail)
  in the *Amazon Web Services Secrets Manager User Guide*. To learn more about
  CloudTrail, including enabling it and find your log files, see the [Amazon Web Services CloudTrail User
  Guide](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/what_is_cloud_trail_top_level.html).
  """

  alias AWS.Client
  alias AWS.Request

  def metadata do
    %{
      abbreviation: nil,
      api_version: "2017-10-17",
      content_type: "application/x-amz-json-1.1",
      credential_scope: nil,
      endpoint_prefix: "secretsmanager",
      global?: false,
      protocol: "json",
      service_id: "Secrets Manager",
      signature_version: "v4",
      signing_name: "secretsmanager",
      target_prefix: "secretsmanager"
    }
  end

  @doc """
  Retrieves the contents of the encrypted fields `SecretString` or `SecretBinary`
  for up to 20 secrets.

  To retrieve a single secret, call `GetSecretValue`.

  To choose which secrets to retrieve, you can specify a list of secrets by name
  or ARN, or you can use filters. If Secrets Manager encounters errors such as
  `AccessDeniedException` while attempting to retrieve any of the secrets, you can
  see the errors in `Errors` in the response.

  Secrets Manager generates CloudTrail `GetSecretValue` log entries for each
  secret you request when you call this action. Do not include sensitive
  information in request parameters because it might be logged. For more
  information, see [Logging Secrets Manager events with CloudTrail](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html).

  **Required permissions: ** `secretsmanager:BatchGetSecretValue`, and you must
  have `secretsmanager:GetSecretValue` for each secret. If you use filters, you
  must also have `secretsmanager:ListSecrets`. If the secrets are encrypted using
  customer-managed keys instead of the Amazon Web Services managed key
  `aws/secretsmanager`, then you also need `kms:Decrypt` permissions for the keys.
  For more information, see [ IAM policy actions for Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions)
  and [Authentication and access control in Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html).
  """
  def batch_get_secret_value(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "BatchGetSecretValue", input, options)
  end

  @doc """
  Turns off automatic rotation, and if a rotation is currently in progress,
  cancels the rotation.

  If you cancel a rotation in progress, it can leave the `VersionStage` labels in
  an unexpected state. You might need to remove the staging label `AWSPENDING`
  from the partially created version. You also need to determine whether to roll
  back to the previous version of the secret by moving the staging label
  `AWSCURRENT` to the version that has `AWSPENDING`. To determine which version
  has a specific staging label, call `ListSecretVersionIds`. Then use
  `UpdateSecretVersionStage` to change staging labels. For more information, see
  [How rotation works](https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotate-secrets_how.html).

  To turn on automatic rotation again, call `RotateSecret`.

  Secrets Manager generates a CloudTrail log entry when you call this action. Do
  not include sensitive information in request parameters because it might be
  logged. For more information, see [Logging Secrets Manager events with CloudTrail](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html).

  **Required permissions: ** `secretsmanager:CancelRotateSecret`. For more
  information, see [ IAM policy actions for Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions)
  and [Authentication and access control in Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html).
  """
  def cancel_rotate_secret(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CancelRotateSecret", input, options)
  end

  @doc """
  Creates a new secret.

  A *secret* can be a password, a set of credentials such as a user name and
  password, an OAuth token, or other secret information that you store in an
  encrypted form in Secrets Manager. The secret also includes the connection
  information to access a database or other service, which Secrets Manager doesn't
  encrypt. A secret in Secrets Manager consists of both the protected secret data
  and the important information needed to manage the secret.

  For secrets that use *managed rotation*, you need to create the secret through
  the managing service. For more information, see [Secrets Manager secrets managed by other Amazon Web Services
  services](https://docs.aws.amazon.com/secretsmanager/latest/userguide/service-linked-secrets.html).

  For information about creating a secret in the console, see [Create a secret](https://docs.aws.amazon.com/secretsmanager/latest/userguide/manage_create-basic-secret.html).

  To create a secret, you can provide the secret value to be encrypted in either
  the `SecretString` parameter or the `SecretBinary` parameter, but not both. If
  you include `SecretString` or `SecretBinary` then Secrets Manager creates an
  initial secret version and automatically attaches the staging label `AWSCURRENT`
  to it.

  For database credentials you want to rotate, for Secrets Manager to be able to
  rotate the secret, you must make sure the JSON you store in the `SecretString`
  matches the [JSON structure of a database secret](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_secret_json_structure.html).

  If you don't specify an KMS encryption key, Secrets Manager uses the Amazon Web
  Services managed key `aws/secretsmanager`. If this key doesn't already exist in
  your account, then Secrets Manager creates it for you automatically. All users
  and roles in the Amazon Web Services account automatically have access to use
  `aws/secretsmanager`. Creating `aws/secretsmanager` can result in a one-time
  significant delay in returning the result.

  If the secret is in a different Amazon Web Services account from the credentials
  calling the API, then you can't use `aws/secretsmanager` to encrypt the secret,
  and you must create and use a customer managed KMS key.

  Secrets Manager generates a CloudTrail log entry when you call this action. Do
  not include sensitive information in request parameters except `SecretBinary` or
  `SecretString` because it might be logged. For more information, see [Logging Secrets Manager events with
  CloudTrail](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html).

  **Required permissions: ** `secretsmanager:CreateSecret`. If you include tags in
  the secret, you also need `secretsmanager:TagResource`. For more information,
  see [ IAM policy actions for Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions)
  and [Authentication and access control in Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html).

  To encrypt the secret with a KMS key other than `aws/secretsmanager`, you need
  `kms:GenerateDataKey` and `kms:Decrypt` permission to the key.
  """
  def create_secret(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateSecret", input, options)
  end

  @doc """
  Deletes the resource-based permission policy attached to the secret.

  To attach a policy to a secret, use `PutResourcePolicy`.

  Secrets Manager generates a CloudTrail log entry when you call this action. Do
  not include sensitive information in request parameters because it might be
  logged. For more information, see [Logging Secrets Manager events with CloudTrail](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html).

  **Required permissions: ** `secretsmanager:DeleteResourcePolicy`. For more
  information, see [ IAM policy actions for Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions)
  and [Authentication and access control in Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html).
  """
  def delete_resource_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteResourcePolicy", input, options)
  end

  @doc """
  Deletes a secret and all of its versions.

  You can specify a recovery window during which you can restore the secret. The
  minimum recovery window is 7 days. The default recovery window is 30 days.
  Secrets Manager attaches a `DeletionDate` stamp to the secret that specifies the
  end of the recovery window. At the end of the recovery window, Secrets Manager
  deletes the secret permanently.

  You can't delete a primary secret that is replicated to other Regions. You must
  first delete the replicas using `RemoveRegionsFromReplication`, and then delete
  the primary secret. When you delete a replica, it is deleted immediately.

  You can't directly delete a version of a secret. Instead, you remove all staging
  labels from the version using `UpdateSecretVersionStage`. This marks the version
  as deprecated, and then Secrets Manager can automatically delete the version in
  the background.

  To determine whether an application still uses a secret, you can create an
  Amazon CloudWatch alarm to alert you to any attempts to access a secret during
  the recovery window. For more information, see [ Monitor secrets scheduled for deletion](https://docs.aws.amazon.com/secretsmanager/latest/userguide/monitoring_cloudwatch_deleted-secrets.html).

  Secrets Manager performs the permanent secret deletion at the end of the waiting
  period as a background task with low priority. There is no guarantee of a
  specific time after the recovery window for the permanent delete to occur.

  At any time before recovery window ends, you can use `RestoreSecret` to remove
  the `DeletionDate` and cancel the deletion of the secret.

  When a secret is scheduled for deletion, you cannot retrieve the secret value.
  You must first cancel the deletion with `RestoreSecret` and then you can
  retrieve the secret.

  Secrets Manager generates a CloudTrail log entry when you call this action. Do
  not include sensitive information in request parameters because it might be
  logged. For more information, see [Logging Secrets Manager events with CloudTrail](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html).

  **Required permissions: ** `secretsmanager:DeleteSecret`. For more information,
  see [ IAM policy actions for Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions)
  and [Authentication and access control in Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html).
  """
  def delete_secret(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteSecret", input, options)
  end

  @doc """
  Retrieves the details of a secret.

  It does not include the encrypted secret value. Secrets Manager only returns
  fields that have a value in the response.

  Secrets Manager generates a CloudTrail log entry when you call this action. Do
  not include sensitive information in request parameters because it might be
  logged. For more information, see [Logging Secrets Manager events with CloudTrail](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html).

  **Required permissions: ** `secretsmanager:DescribeSecret`. For more
  information, see [ IAM policy actions for Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions)
  and [Authentication and access control in Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html).
  """
  def describe_secret(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeSecret", input, options)
  end

  @doc """
  Generates a random password.

  We recommend that you specify the maximum length and include every character
  type that the system you are generating a password for can support.

  Secrets Manager generates a CloudTrail log entry when you call this action. Do
  not include sensitive information in request parameters because it might be
  logged. For more information, see [Logging Secrets Manager events with CloudTrail](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html).

  **Required permissions: ** `secretsmanager:GetRandomPassword`. For more
  information, see [ IAM policy actions for Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions)
  and [Authentication and access control in Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html).
  """
  def get_random_password(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "GetRandomPassword", input, options)
  end

  @doc """
  Retrieves the JSON text of the resource-based policy document attached to the
  secret.

  For more information about permissions policies attached to a secret, see
  [Permissions policies attached to a secret](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access_resource-policies.html).

  Secrets Manager generates a CloudTrail log entry when you call this action. Do
  not include sensitive information in request parameters because it might be
  logged. For more information, see [Logging Secrets Manager events with CloudTrail](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html).

  **Required permissions: ** `secretsmanager:GetResourcePolicy`. For more
  information, see [ IAM policy actions for Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions)
  and [Authentication and access control in Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html).
  """
  def get_resource_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "GetResourcePolicy", input, options)
  end

  @doc """
  Retrieves the contents of the encrypted fields `SecretString` or `SecretBinary`
  from the specified version of a secret, whichever contains content.

  To retrieve the values for a group of secrets, call `BatchGetSecretValue`.

  We recommend that you cache your secret values by using client-side caching.
  Caching secrets improves speed and reduces your costs. For more information, see
  [Cache secrets for your applications](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieving-secrets.html).

  To retrieve the previous version of a secret, use `VersionStage` and specify
  AWSPREVIOUS. To revert to the previous version of a secret, call
  [UpdateSecretVersionStage](https://docs.aws.amazon.com/cli/latest/reference/secretsmanager/update-secret-version-stage.html).  Secrets Manager generates a CloudTrail log entry when you call this action. Do
  not include sensitive information in request parameters because it might be
  logged. For more information, see [Logging Secrets Manager events with
  CloudTrail](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html).

  **Required permissions: ** `secretsmanager:GetSecretValue`. If the secret is
  encrypted using a customer-managed key instead of the Amazon Web Services
  managed key `aws/secretsmanager`, then you also need `kms:Decrypt` permissions
  for that key. For more information, see [ IAM policy actions for Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions)
  and [Authentication and access control in Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html).
  """
  def get_secret_value(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "GetSecretValue", input, options)
  end

  @doc """
  Lists the versions of a secret.

  Secrets Manager uses staging labels to indicate the different versions of a
  secret. For more information, see [ Secrets Manager concepts: Versions](https://docs.aws.amazon.com/secretsmanager/latest/userguide/getting-started.html#term_version).

  To list the secrets in the account, use `ListSecrets`.

  Secrets Manager generates a CloudTrail log entry when you call this action. Do
  not include sensitive information in request parameters because it might be
  logged. For more information, see [Logging Secrets Manager events with CloudTrail](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html).

  **Required permissions: ** `secretsmanager:ListSecretVersionIds`. For more
  information, see [ IAM policy actions for Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions)
  and [Authentication and access control in Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html).
  """
  def list_secret_version_ids(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListSecretVersionIds", input, options)
  end

  @doc """
  Lists the secrets that are stored by Secrets Manager in the Amazon Web Services
  account, not including secrets that are marked for deletion.

  To see secrets marked for deletion, use the Secrets Manager console.

  ListSecrets is eventually consistent, however it might not reflect changes from
  the last five minutes. To get the latest information for a specific secret, use
  `DescribeSecret`.

  To list the versions of a secret, use `ListSecretVersionIds`.

  To retrieve the values for the secrets, call `BatchGetSecretValue` or
  `GetSecretValue`.

  For information about finding secrets in the console, see [Find secrets in Secrets
  Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/manage_search-secret.html).

  Secrets Manager generates a CloudTrail log entry when you call this action. Do
  not include sensitive information in request parameters because it might be
  logged. For more information, see [Logging Secrets Manager events with CloudTrail](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html).

  **Required permissions: ** `secretsmanager:ListSecrets`. For more information,
  see [ IAM policy actions for Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions)
  and [Authentication and access control in Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html).
  """
  def list_secrets(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListSecrets", input, options)
  end

  @doc """
  Attaches a resource-based permission policy to a secret.

  A resource-based policy is optional. For more information, see [Authentication and access control for Secrets
  Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html)

  For information about attaching a policy in the console, see [Attach a permissions policy to a
  secret](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access_resource-based-policies.html).

  Secrets Manager generates a CloudTrail log entry when you call this action. Do
  not include sensitive information in request parameters because it might be
  logged. For more information, see [Logging Secrets Manager events with CloudTrail](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html).

  **Required permissions: ** `secretsmanager:PutResourcePolicy`. For more
  information, see [ IAM policy actions for Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions)
  and [Authentication and access control in Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html).
  """
  def put_resource_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "PutResourcePolicy", input, options)
  end

  @doc """
  Creates a new version with a new encrypted secret value and attaches it to the
  secret.

  The version can contain a new `SecretString` value or a new `SecretBinary`
  value.

  We recommend you avoid calling `PutSecretValue` at a sustained rate of more than
  once every 10 minutes. When you update the secret value, Secrets Manager creates
  a new version of the secret. Secrets Manager removes outdated versions when
  there are more than 100, but it does not remove versions created less than 24
  hours ago. If you call `PutSecretValue` more than once every 10 minutes, you
  create more versions than Secrets Manager removes, and you will reach the quota
  for secret versions.

  You can specify the staging labels to attach to the new version in
  `VersionStages`. If you don't include `VersionStages`, then Secrets Manager
  automatically moves the staging label `AWSCURRENT` to this version. If this
  operation creates the first version for the secret, then Secrets Manager
  automatically attaches the staging label `AWSCURRENT` to it. If this operation
  moves the staging label `AWSCURRENT` from another version to this version, then
  Secrets Manager also automatically moves the staging label `AWSPREVIOUS` to the
  version that `AWSCURRENT` was removed from.

  This operation is idempotent. If you call this operation with a
  `ClientRequestToken` that matches an existing version's VersionId, and you
  specify the same secret data, the operation succeeds but does nothing. However,
  if the secret data is different, then the operation fails because you can't
  modify an existing version; you can only create new ones.

  Secrets Manager generates a CloudTrail log entry when you call this action. Do
  not include sensitive information in request parameters except `SecretBinary` or
  `SecretString` because it might be logged. For more information, see [Logging Secrets Manager events with
  CloudTrail](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html).

  **Required permissions: ** `secretsmanager:PutSecretValue`. For more
  information, see [ IAM policy actions for Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions)
  and [Authentication and access control in Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html).
  """
  def put_secret_value(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "PutSecretValue", input, options)
  end

  @doc """
  For a secret that is replicated to other Regions, deletes the secret replicas
  from the Regions you specify.

  Secrets Manager generates a CloudTrail log entry when you call this action. Do
  not include sensitive information in request parameters because it might be
  logged. For more information, see [Logging Secrets Manager events with CloudTrail](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html).

  **Required permissions: ** `secretsmanager:RemoveRegionsFromReplication`. For
  more information, see [ IAM policy actions for Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions)
  and [Authentication and access control in Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html).
  """
  def remove_regions_from_replication(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "RemoveRegionsFromReplication", input, options)
  end

  @doc """
  Replicates the secret to a new Regions.

  See [Multi-Region secrets](https://docs.aws.amazon.com/secretsmanager/latest/userguide/create-manage-multi-region-secrets.html).

  Secrets Manager generates a CloudTrail log entry when you call this action. Do
  not include sensitive information in request parameters because it might be
  logged. For more information, see [Logging Secrets Manager events with CloudTrail](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html).

  **Required permissions: ** `secretsmanager:ReplicateSecretToRegions`. For more
  information, see [ IAM policy actions for Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions)
  and [Authentication and access control in Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html).
  """
  def replicate_secret_to_regions(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ReplicateSecretToRegions", input, options)
  end

  @doc """
  Cancels the scheduled deletion of a secret by removing the `DeletedDate` time
  stamp.

  You can access a secret again after it has been restored.

  Secrets Manager generates a CloudTrail log entry when you call this action. Do
  not include sensitive information in request parameters because it might be
  logged. For more information, see [Logging Secrets Manager events with CloudTrail](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html).

  **Required permissions: ** `secretsmanager:RestoreSecret`. For more information,
  see [ IAM policy actions for Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions)
  and [Authentication and access control in Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html).
  """
  def restore_secret(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "RestoreSecret", input, options)
  end

  @doc """
  Configures and starts the asynchronous process of rotating the secret.

  For information about rotation, see [Rotate secrets](https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotating-secrets.html)
  in the *Secrets Manager User Guide*. If you include the configuration
  parameters, the operation sets the values for the secret and then immediately
  starts a rotation. If you don't include the configuration parameters, the
  operation starts a rotation with the values already stored in the secret.

  When rotation is successful, the `AWSPENDING` staging label might be attached to
  the same version as the `AWSCURRENT` version, or it might not be attached to any
  version. If the `AWSPENDING` staging label is present but not attached to the
  same version as `AWSCURRENT`, then any later invocation of `RotateSecret`
  assumes that a previous rotation request is still in progress and returns an
  error. When rotation is unsuccessful, the `AWSPENDING` staging label might be
  attached to an empty secret version. For more information, see [Troubleshoot rotation](https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot_rotation.html)
  in the *Secrets Manager User Guide*.

  Secrets Manager generates a CloudTrail log entry when you call this action. Do
  not include sensitive information in request parameters because it might be
  logged. For more information, see [Logging Secrets Manager events with CloudTrail](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html).

  **Required permissions: ** `secretsmanager:RotateSecret`. For more information,
  see [ IAM policy actions for Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions)
  and [Authentication and access control in Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html).
  You also need `lambda:InvokeFunction` permissions on the rotation function. For
  more information, see [ Permissions for rotation](https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotating-secrets-required-permissions-function.html).
  """
  def rotate_secret(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "RotateSecret", input, options)
  end

  @doc """
  Removes the link between the replica secret and the primary secret and promotes
  the replica to a primary secret in the replica Region.

  You must call this operation from the Region in which you want to promote the
  replica to a primary secret.

  Secrets Manager generates a CloudTrail log entry when you call this action. Do
  not include sensitive information in request parameters because it might be
  logged. For more information, see [Logging Secrets Manager events with CloudTrail](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html).

  **Required permissions: ** `secretsmanager:StopReplicationToReplica`. For more
  information, see [ IAM policy actions for Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions)
  and [Authentication and access control in Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html).
  """
  def stop_replication_to_replica(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "StopReplicationToReplica", input, options)
  end

  @doc """
  Attaches tags to a secret.

  Tags consist of a key name and a value. Tags are part of the secret's metadata.
  They are not associated with specific versions of the secret. This operation
  appends tags to the existing list of tags.

  For tag quotas and naming restrictions, see [Service quotas for Tagging](https://docs.aws.amazon.com/general/latest/gr/arg.html#taged-reference-quotas)
  in the *Amazon Web Services General Reference guide*.

  If you use tags as part of your security strategy, then adding or removing a tag
  can change permissions. If successfully completing this operation would result
  in you losing your permissions for this secret, then the operation is blocked
  and returns an Access Denied error.

  Secrets Manager generates a CloudTrail log entry when you call this action. Do
  not include sensitive information in request parameters because it might be
  logged. For more information, see [Logging Secrets Manager events with CloudTrail](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html).

  **Required permissions: ** `secretsmanager:TagResource`. For more information,
  see [ IAM policy actions for Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions)
  and [Authentication and access control in Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html).
  """
  def tag_resource(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "TagResource", input, options)
  end

  @doc """
  Removes specific tags from a secret.

  This operation is idempotent. If a requested tag is not attached to the secret,
  no error is returned and the secret metadata is unchanged.

  If you use tags as part of your security strategy, then removing a tag can
  change permissions. If successfully completing this operation would result in
  you losing your permissions for this secret, then the operation is blocked and
  returns an Access Denied error.

  Secrets Manager generates a CloudTrail log entry when you call this action. Do
  not include sensitive information in request parameters because it might be
  logged. For more information, see [Logging Secrets Manager events with CloudTrail](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html).

  **Required permissions: ** `secretsmanager:UntagResource`. For more information,
  see [ IAM policy actions for Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions)
  and [Authentication and access control in Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html).
  """
  def untag_resource(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UntagResource", input, options)
  end

  @doc """
  Modifies the details of a secret, including metadata and the secret value.

  To change the secret value, you can also use `PutSecretValue`.

  To change the rotation configuration of a secret, use `RotateSecret` instead.

  To change a secret so that it is managed by another service, you need to
  recreate the secret in that service. See [Secrets Manager secrets managed by other Amazon Web Services
  services](https://docs.aws.amazon.com/secretsmanager/latest/userguide/service-linked-secrets.html).

  We recommend you avoid calling `UpdateSecret` at a sustained rate of more than
  once every 10 minutes. When you call `UpdateSecret` to update the secret value,
  Secrets Manager creates a new version of the secret. Secrets Manager removes
  outdated versions when there are more than 100, but it does not remove versions
  created less than 24 hours ago. If you update the secret value more than once
  every 10 minutes, you create more versions than Secrets Manager removes, and you
  will reach the quota for secret versions.

  If you include `SecretString` or `SecretBinary` to create a new secret version,
  Secrets Manager automatically moves the staging label `AWSCURRENT` to the new
  version. Then it attaches the label `AWSPREVIOUS` to the version that
  `AWSCURRENT` was removed from.

  If you call this operation with a `ClientRequestToken` that matches an existing
  version's `VersionId`, the operation results in an error. You can't modify an
  existing version, you can only create a new version. To remove a version, remove
  all staging labels from it. See `UpdateSecretVersionStage`.

  Secrets Manager generates a CloudTrail log entry when you call this action. Do
  not include sensitive information in request parameters except `SecretBinary` or
  `SecretString` because it might be logged. For more information, see [Logging Secrets Manager events with
  CloudTrail](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html).

  **Required permissions: ** `secretsmanager:UpdateSecret`. For more information,
  see [ IAM policy actions for Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions)
  and [Authentication and access control in Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html).
  If you use a customer managed key, you must also have `kms:GenerateDataKey`,
  `kms:Encrypt`, and `kms:Decrypt` permissions on the key. If you change the KMS
  key and you don't have `kms:Encrypt` permission to the new key, Secrets Manager
  does not re-ecrypt existing secret versions with the new key. For more
  information, see [ Secret encryption and decryption](https://docs.aws.amazon.com/secretsmanager/latest/userguide/security-encryption.html).
  """
  def update_secret(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateSecret", input, options)
  end

  @doc """
  Modifies the staging labels attached to a version of a secret.

  Secrets Manager uses staging labels to track a version as it progresses through
  the secret rotation process. Each staging label can be attached to only one
  version at a time. To add a staging label to a version when it is already
  attached to another version, Secrets Manager first removes it from the other
  version first and then attaches it to this one. For more information about
  versions and staging labels, see [Concepts: Version](https://docs.aws.amazon.com/secretsmanager/latest/userguide/getting-started.html#term_version).

  The staging labels that you specify in the `VersionStage` parameter are added to
  the existing list of staging labels for the version.

  You can move the `AWSCURRENT` staging label to this version by including it in
  this call.

  Whenever you move `AWSCURRENT`, Secrets Manager automatically moves the label
  `AWSPREVIOUS` to the version that `AWSCURRENT` was removed from.

  If this action results in the last label being removed from a version, then the
  version is considered to be 'deprecated' and can be deleted by Secrets Manager.

  Secrets Manager generates a CloudTrail log entry when you call this action. Do
  not include sensitive information in request parameters because it might be
  logged. For more information, see [Logging Secrets Manager events with CloudTrail](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html).

  **Required permissions: ** `secretsmanager:UpdateSecretVersionStage`. For more
  information, see [ IAM policy actions for Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions)
  and [Authentication and access control in Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html).
  """
  def update_secret_version_stage(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateSecretVersionStage", input, options)
  end

  @doc """
  Validates that a resource policy does not grant a wide range of principals
  access to your secret.

  A resource-based policy is optional for secrets.

  The API performs three checks when validating the policy:

    * Sends a call to
  [Zelkova](https://aws.amazon.com/blogs/security/protect-sensitive-data-in-the-cloud-with-automated-reasoning-zelkova/), an automated reasoning engine, to ensure your resource policy does not allow
  broad access to your secret, for example policies that use a wildcard for the
  principal.

    * Checks for correct syntax in a policy.

    * Verifies the policy does not lock out a caller.

  Secrets Manager generates a CloudTrail log entry when you call this action. Do
  not include sensitive information in request parameters because it might be
  logged. For more information, see [Logging Secrets Manager events with
  CloudTrail](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html).

  **Required permissions: ** `secretsmanager:ValidateResourcePolicy` and
  `secretsmanager:PutResourcePolicy`. For more information, see [ IAM policy actions for Secrets
  Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions)
  and [Authentication and access control in Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html).
  """
  def validate_resource_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ValidateResourcePolicy", input, options)
  end
end
