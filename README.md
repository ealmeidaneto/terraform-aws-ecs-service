## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| capacity\_provider\_strategy | (Optional) The capacity provider strategy to use for the service. Can be one or more. Defined below. | `list(map(any))` | `[]` | no |
| cluster | (Optional) ARN of an ECS cluster | `string` | n/a | yes |
| deployment\_controller | (Optional) Configuration block containing deployment controller configuration. Valid values: CODE\_DEPLOY, ECS, EXTERNAL. Default: ECS. | `string` | `"ECS"` | no |
| deployment\_maximum\_percent | (Optional) The upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment. Not valid when using the DAEMON scheduling strategy. | `number` | `200` | no |
| deployment\_minimum\_healthy\_percent | (Optional) The lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment. | `number` | `100` | no |
| desired\_count | (Optional) The number of instances of the task definition to place and keep running. Defaults to 0. Do not specify if using the DAEMON scheduling strategy. | `number` | `0` | no |
| enable\_ecs\_managed\_tags | (Optional) Specifies whether to enable Amazon ECS managed tags for the tasks within the service. | `bool` | `false` | no |
| force\_new\_deployment | (Optional) Enable to force a new task deployment of the service. This can be used to update tasks to use a newer Docker image with same image/tag combination (e.g. myimage:latest), roll Fargate tasks onto a newer platform version, or immediately deploy ordered\_placement\_strategy and placement\_constraints updates. | `bool` | `false` | no |
| health\_check\_grace\_period\_seconds | (Optional) Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 2147483647. Only valid for services configured to use load balancers. | `number` | `0` | no |
| iam\_role | (Optional) ARN of the IAM role that allows Amazon ECS to make calls to your load balancer on your behalf. This parameter is required if you are using a load balancer with your service, but only if your task definition does not use the awsvpc network mode. If using awsvpc network mode, do not specify this role. If your account has already created the Amazon ECS service-linked role, that role is used by default for your service unless you specify a role here. | `string` | `""` | no |
| launch\_type | (Optional) The launch type on which to run your service. The valid values are EC2 and FARGATE. Defaults to EC2. | `string` | `"EC2"` | no |
| load\_balancer | (Optional) A load balancer block. (https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service#load_balancer) | `list(map(string))` | `[]` | no |
| name | (Required) The name of the service (up to 255 letters, numbers, hyphens, and underscores) | `string` | n/a | yes |
| network\_configuration | description | `list(map(string))` | `[]` | no |
| ordered\_placement\_strategy | (Optional) Service level strategy rules that are taken into consideration during task placement. List from top to bottom in order of precedence. Updates to this configuration will take effect next task deployment unless force\_new\_deployment is enabled. The maximum number of ordered\_placement\_strategy blocks is 5 | `list(map(string))` | `[]` | no |
| placement\_constraints | (Optional) rules that are taken into consideration during task placement. Updates to this configuration will take effect next task deployment unless force\_new\_deployment is enabled. Maximum number of placement\_constraints is 10 | `list(map(any))` | `[]` | no |
| platform\_version | description | `string` | `"LATEST"` | no |
| propagate\_tags | (Optional) Specifies whether to propagate the tags from the task definition or the service to the tasks. The valid values are SERVICE and TASK\_DEFINITION. | `string` | `""` | no |
| scheduling\_strategy | (Optional) The scheduling strategy to use for the service. The valid values are REPLICA and DAEMON. Defaults to REPLICA. Note that Tasks using the Fargate launch type or the CODE\_DEPLOY or EXTERNAL deployment controller types don't support the DAEMON scheduling strategy. | `string` | `"REPLICA"` | no |
| service\_registries | (Optional) The service discovery registries for the service. The maximum number of service\_registries blocks is 1. | `list(map(any))` | `[]` | no |
| tags | (Optional) Key-value map of resource tags | `map` | `{}` | no |
| task\_definition | (Optional) The family and revision (family:revision) or full ARN of the task definition that you want to run in your service. Required unless using the EXTERNAL deployment controller. If a revision is not specified, the latest ACTIVE revision is used. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| cluster | The Amazon Resource Name (ARN) of cluster which the service runs on |
| desired\_count | The number of instances of the task definition |
| iam\_role | The ARN of IAM role used for ELB |
| id | The Amazon Resource Name (ARN) that identifies the service |
| name | The name of the service |
