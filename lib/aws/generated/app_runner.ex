# WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
# See https://github.com/aws-beam/aws-codegen for more details.

defmodule AWS.AppRunner do
  @moduledoc """
  App Runner

  App Runner is an application service that provides a fast, simple, and
  cost-effective way to go directly from an existing container image or source
  code to a running service in the Amazon Web Services Cloud in seconds.

  You don't need to learn new technologies, decide which compute service to use,
  or understand how to provision and configure Amazon Web Services resources.

  App Runner connects directly to your container registry or source code
  repository. It provides an automatic delivery pipeline with fully managed
  operations, high performance, scalability, and security.

  For more information about App Runner, see the [App Runner Developer Guide](https://docs.aws.amazon.com/apprunner/latest/dg/). For release
  information, see the [App Runner Release Notes](https://docs.aws.amazon.com/apprunner/latest/relnotes/).

  To install the Software Development Kits (SDKs), Integrated Development
  Environment (IDE) Toolkits, and command line tools that you can use to access
  the API, see [Tools for Amazon Web Services](http://aws.amazon.com/tools/).  ## Endpoints

  For a list of Region-specific endpoints that App Runner supports, see [App
  Runner endpoints and
  quotas](https://docs.aws.amazon.com/general/latest/gr/apprunner.html) in the
  *Amazon Web Services General Reference*.
  """

  alias AWS.Client
  alias AWS.Request

  def metadata do
    %{
      abbreviation: nil,
      api_version: "2020-05-15",
      content_type: "application/x-amz-json-1.0",
      credential_scope: nil,
      endpoint_prefix: "apprunner",
      global?: false,
      protocol: "json",
      service_id: "AppRunner",
      signature_version: "v4",
      signing_name: "apprunner",
      target_prefix: "AppRunner"
    }
  end

  @doc """
  Associate your own domain name with the App Runner subdomain URL of your App
  Runner service.

  After you call `AssociateCustomDomain` and receive a successful response, use
  the information in the `CustomDomain` record that's returned to add CNAME
  records to your Domain Name System (DNS). For each mapped domain name, add a
  mapping to the target App Runner subdomain and one or more certificate
  validation records. App Runner then performs DNS validation to verify that you
  own or control the domain name that you associated. App Runner tracks domain
  validity in a certificate stored in [AWS Certificate Manager (ACM)](https://docs.aws.amazon.com/acm/latest/userguide).
  """
  def associate_custom_domain(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "AssociateCustomDomain", input, options)
  end

  @doc """
  Create an App Runner automatic scaling configuration resource.

  App Runner requires this resource when you create or update App Runner services
  and you require non-default auto scaling settings. You can share an auto scaling
  configuration across multiple services.

  Create multiple revisions of a configuration by calling this action multiple
  times using the same `AutoScalingConfigurationName`. The call returns
  incremental `AutoScalingConfigurationRevision` values. When you create a service
  and configure an auto scaling configuration resource, the service uses the
  latest active revision of the auto scaling configuration by default. You can
  optionally configure the service to use a specific revision.

  Configure a higher `MinSize` to increase the spread of your App Runner service
  over more Availability Zones in the Amazon Web Services Region. The tradeoff is
  a higher minimal cost.

  Configure a lower `MaxSize` to control your cost. The tradeoff is lower
  responsiveness during peak demand.
  """
  def create_auto_scaling_configuration(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateAutoScalingConfiguration", input, options)
  end

  @doc """
  Create an App Runner connection resource.

  App Runner requires a connection resource when you create App Runner services
  that access private repositories from certain third-party providers. You can
  share a connection across multiple services.

  A connection resource is needed to access GitHub and Bitbucket repositories.
  Both require a user interface approval process through the App Runner console
  before you can use the connection.
  """
  def create_connection(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateConnection", input, options)
  end

  @doc """
  Create an App Runner observability configuration resource.

  App Runner requires this resource when you create or update App Runner services
  and you want to enable non-default observability features. You can share an
  observability configuration across multiple services.

  Create multiple revisions of a configuration by calling this action multiple
  times using the same `ObservabilityConfigurationName`. The call returns
  incremental `ObservabilityConfigurationRevision` values. When you create a
  service and configure an observability configuration resource, the service uses
  the latest active revision of the observability configuration by default. You
  can optionally configure the service to use a specific revision.

  The observability configuration resource is designed to configure multiple
  features (currently one feature, tracing). This action takes optional parameters
  that describe the configuration of these features (currently one parameter,
  `TraceConfiguration`). If you don't specify a feature parameter, App Runner
  doesn't enable the feature.
  """
  def create_observability_configuration(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateObservabilityConfiguration", input, options)
  end

  @doc """
  Create an App Runner service.

  After the service is created, the action also automatically starts a deployment.

  This is an asynchronous operation. On a successful call, you can use the
  returned `OperationId` and the
  [ListOperations](https://docs.aws.amazon.com/apprunner/latest/api/API_ListOperations.html)
  call to track the operation's progress.
  """
  def create_service(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateService", input, options)
  end

  @doc """
  Create an App Runner VPC connector resource.

  App Runner requires this resource when you want to associate your App Runner
  service to a custom Amazon Virtual Private Cloud (Amazon VPC).
  """
  def create_vpc_connector(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateVpcConnector", input, options)
  end

  @doc """
  Create an App Runner VPC Ingress Connection resource.

  App Runner requires this resource when you want to associate your App Runner
  service with an Amazon VPC endpoint.
  """
  def create_vpc_ingress_connection(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateVpcIngressConnection", input, options)
  end

  @doc """
  Delete an App Runner automatic scaling configuration resource.

  You can delete a top level auto scaling configuration, a specific revision of
  one, or all revisions associated with the top level configuration. You can't
  delete the default auto scaling configuration or a configuration that's used by
  one or more App Runner services.
  """
  def delete_auto_scaling_configuration(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteAutoScalingConfiguration", input, options)
  end

  @doc """
  Delete an App Runner connection.

  You must first ensure that there are no running App Runner services that use
  this connection. If there are any, the `DeleteConnection` action fails.
  """
  def delete_connection(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteConnection", input, options)
  end

  @doc """
  Delete an App Runner observability configuration resource.

  You can delete a specific revision or the latest active revision. You can't
  delete a configuration that's used by one or more App Runner services.
  """
  def delete_observability_configuration(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteObservabilityConfiguration", input, options)
  end

  @doc """
  Delete an App Runner service.

  This is an asynchronous operation. On a successful call, you can use the
  returned `OperationId` and the `ListOperations` call to track the operation's
  progress.

  Make sure that you don't have any active VPCIngressConnections associated with
  the service you want to delete.
  """
  def delete_service(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteService", input, options)
  end

  @doc """
  Delete an App Runner VPC connector resource.

  You can't delete a connector that's used by one or more App Runner services.
  """
  def delete_vpc_connector(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteVpcConnector", input, options)
  end

  @doc """
  Delete an App Runner VPC Ingress Connection resource that's associated with an
  App Runner service.

  The VPC Ingress Connection must be in one of the following states to be deleted:

    * `AVAILABLE`

    * `FAILED_CREATION`

    * `FAILED_UPDATE`

    * `FAILED_DELETION`
  """
  def delete_vpc_ingress_connection(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteVpcIngressConnection", input, options)
  end

  @doc """
  Return a full description of an App Runner automatic scaling configuration
  resource.
  """
  def describe_auto_scaling_configuration(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeAutoScalingConfiguration", input, options)
  end

  @doc """
  Return a description of custom domain names that are associated with an App
  Runner service.
  """
  def describe_custom_domains(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeCustomDomains", input, options)
  end

  @doc """
  Return a full description of an App Runner observability configuration resource.
  """
  def describe_observability_configuration(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeObservabilityConfiguration", input, options)
  end

  @doc """
  Return a full description of an App Runner service.
  """
  def describe_service(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeService", input, options)
  end

  @doc """
  Return a description of an App Runner VPC connector resource.
  """
  def describe_vpc_connector(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeVpcConnector", input, options)
  end

  @doc """
  Return a full description of an App Runner VPC Ingress Connection resource.
  """
  def describe_vpc_ingress_connection(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeVpcIngressConnection", input, options)
  end

  @doc """
  Disassociate a custom domain name from an App Runner service.

  Certificates tracking domain validity are associated with a custom domain and
  are stored in [AWS Certificate Manager (ACM)](https://docs.aws.amazon.com/acm/latest/userguide). These certificates
  aren't deleted as part of this action. App Runner delays certificate deletion
  for 30 days after a domain is disassociated from your service.
  """
  def disassociate_custom_domain(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DisassociateCustomDomain", input, options)
  end

  @doc """
  Returns a list of active App Runner automatic scaling configurations in your
  Amazon Web Services account.

  You can query the revisions for a specific configuration name or the revisions
  for all active configurations in your account. You can optionally query only the
  latest revision of each requested name.

  To retrieve a full description of a particular configuration revision, call and
  provide one of the ARNs returned by `ListAutoScalingConfigurations`.
  """
  def list_auto_scaling_configurations(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListAutoScalingConfigurations", input, options)
  end

  @doc """
  Returns a list of App Runner connections that are associated with your Amazon
  Web Services account.
  """
  def list_connections(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListConnections", input, options)
  end

  @doc """
  Returns a list of active App Runner observability configurations in your Amazon
  Web Services account.

  You can query the revisions for a specific configuration name or the revisions
  for all active configurations in your account. You can optionally query only the
  latest revision of each requested name.

  To retrieve a full description of a particular configuration revision, call and
  provide one of the ARNs returned by `ListObservabilityConfigurations`.
  """
  def list_observability_configurations(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListObservabilityConfigurations", input, options)
  end

  @doc """
  Return a list of operations that occurred on an App Runner service.

  The resulting list of `OperationSummary` objects is sorted in reverse
  chronological order. The first object on the list represents the last started
  operation.
  """
  def list_operations(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListOperations", input, options)
  end

  @doc """
  Returns a list of running App Runner services in your Amazon Web Services
  account.
  """
  def list_services(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListServices", input, options)
  end

  @doc """
  Returns a list of the associated App Runner services using an auto scaling
  configuration.
  """
  def list_services_for_auto_scaling_configuration(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListServicesForAutoScalingConfiguration", input, options)
  end

  @doc """
  List tags that are associated with for an App Runner resource.

  The response contains a list of tag key-value pairs.
  """
  def list_tags_for_resource(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListTagsForResource", input, options)
  end

  @doc """
  Returns a list of App Runner VPC connectors in your Amazon Web Services account.
  """
  def list_vpc_connectors(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListVpcConnectors", input, options)
  end

  @doc """
  Return a list of App Runner VPC Ingress Connections in your Amazon Web Services
  account.
  """
  def list_vpc_ingress_connections(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListVpcIngressConnections", input, options)
  end

  @doc """
  Pause an active App Runner service.

  App Runner reduces compute capacity for the service to zero and loses state (for
  example, ephemeral storage is removed).

  This is an asynchronous operation. On a successful call, you can use the
  returned `OperationId` and the `ListOperations` call to track the operation's
  progress.
  """
  def pause_service(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "PauseService", input, options)
  end

  @doc """
  Resume an active App Runner service.

  App Runner provisions compute capacity for the service.

  This is an asynchronous operation. On a successful call, you can use the
  returned `OperationId` and the `ListOperations` call to track the operation's
  progress.
  """
  def resume_service(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ResumeService", input, options)
  end

  @doc """
  Initiate a manual deployment of the latest commit in a source code repository or
  the latest image in a source image repository to an App Runner service.

  For a source code repository, App Runner retrieves the commit and builds a
  Docker image. For a source image repository, App Runner retrieves the latest
  Docker image. In both cases, App Runner then deploys the new image to your
  service and starts a new container instance.

  This is an asynchronous operation. On a successful call, you can use the
  returned `OperationId` and the `ListOperations` call to track the operation's
  progress.
  """
  def start_deployment(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "StartDeployment", input, options)
  end

  @doc """
  Add tags to, or update the tag values of, an App Runner resource.

  A tag is a key-value pair.
  """
  def tag_resource(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "TagResource", input, options)
  end

  @doc """
  Remove tags from an App Runner resource.
  """
  def untag_resource(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UntagResource", input, options)
  end

  @doc """
  Update an auto scaling configuration to be the default.

  The existing default auto scaling configuration will be set to non-default
  automatically.
  """
  def update_default_auto_scaling_configuration(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateDefaultAutoScalingConfiguration", input, options)
  end

  @doc """
  Update an App Runner service.

  You can update the source configuration and instance configuration of the
  service. You can also update the ARN of the auto scaling configuration resource
  that's associated with the service. However, you can't change the name or the
  encryption configuration of the service. These can be set only when you create
  the service.

  To update the tags applied to your service, use the separate actions
  `TagResource` and `UntagResource`.

  This is an asynchronous operation. On a successful call, you can use the
  returned `OperationId` and the `ListOperations` call to track the operation's
  progress.
  """
  def update_service(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateService", input, options)
  end

  @doc """
  Update an existing App Runner VPC Ingress Connection resource.

  The VPC Ingress Connection must be in one of the following states to be updated:

    * AVAILABLE

    * FAILED_CREATION

    * FAILED_UPDATE
  """
  def update_vpc_ingress_connection(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateVpcIngressConnection", input, options)
  end
end
