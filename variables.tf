variable name {
  type        = string
  description = "(Required) The name of the service (up to 255 letters, numbers, hyphens, and underscores)"
}

variable cluster {
  type        = string
  description = "(Optional) ARN of an ECS cluster"
}

variable iam_role {
  type        = string
  default     = ""
  description = "(Optional) ARN of the IAM role that allows Amazon ECS to make calls to your load balancer on your behalf. This parameter is required if you are using a load balancer with your service, but only if your task definition does not use the awsvpc network mode. If using awsvpc network mode, do not specify this role. If your account has already created the Amazon ECS service-linked role, that role is used by default for your service unless you specify a role here."
}

variable tags {
  type        = map
  default     = {}
  description = "(Optional) Key-value map of resource tags"
}

variable task_definition {
  type        = string
  default     = ""
  description = "(Optional) The family and revision (family:revision) or full ARN of the task definition that you want to run in your service. Required unless using the EXTERNAL deployment controller. If a revision is not specified, the latest ACTIVE revision is used."
}

variable load_balancer {
  type        = list(map(string))
  default     = []
  description = "(Optional) A load balancer block. (https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service#load_balancer)"
}

variable deployment_maximum_percent {
  type        = number
  default     = 200
  description = "(Optional) The upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment. Not valid when using the DAEMON scheduling strategy."
}

variable deployment_minimum_healthy_percent {
  type        = number
  default     = 100
  description = "(Optional) The lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment."
}

variable desired_count {
  type        = number
  default     = 0
  description = "(Optional) The number of instances of the task definition to place and keep running. Defaults to 0. Do not specify if using the DAEMON scheduling strategy."
}

variable enable_ecs_managed_tags {
  type        = bool
  default     = false
  description = "(Optional) Specifies whether to enable Amazon ECS managed tags for the tasks within the service."
}

variable force_new_deployment {
  type        = bool
  default     = false
  description = "(Optional) Enable to force a new task deployment of the service. This can be used to update tasks to use a newer Docker image with same image/tag combination (e.g. myimage:latest), roll Fargate tasks onto a newer platform version, or immediately deploy ordered_placement_strategy and placement_constraints updates."
}

variable health_check_grace_period_seconds {
  type        = number
  default     = 0
  description = "(Optional) Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 2147483647. Only valid for services configured to use load balancers."
}

variable launch_type {
  type        = string
  default     = "EC2"
  description = "(Optional) The launch type on which to run your service. The valid values are EC2 and FARGATE. Defaults to EC2."
}

variable network_configuration {
  type        = list(map(string))
  default     = []
  description = "description"
}

variable platform_version {
  type        = string
  default     = "LATEST"
  description = "description"
}

variable ordered_placement_strategy {
  type        = list(map(string))
  default     = []
  description = "(Optional) Service level strategy rules that are taken into consideration during task placement. List from top to bottom in order of precedence. Updates to this configuration will take effect next task deployment unless force_new_deployment is enabled. The maximum number of ordered_placement_strategy blocks is 5"
}

variable capacity_provider_strategy {
  type        = list(map(any))
  default     = []
  description = "(Optional) The capacity provider strategy to use for the service. Can be one or more. Defined below."

}

variable deployment_controller {
  type        = string
  default     = "ECS"
  description = "(Optional) Configuration block containing deployment controller configuration. Valid values: CODE_DEPLOY, ECS, EXTERNAL. Default: ECS."
}

variable placement_constraints {
  type        = list(map(any))
  default     = []
  description = "(Optional) rules that are taken into consideration during task placement. Updates to this configuration will take effect next task deployment unless force_new_deployment is enabled. Maximum number of placement_constraints is 10"
}

variable propagate_tags {
  type        = string
  default     = ""
  description = "(Optional) Specifies whether to propagate the tags from the task definition or the service to the tasks. The valid values are SERVICE and TASK_DEFINITION."
}

variable scheduling_strategy {
  type        = string
  default     = "REPLICA"
  description = "(Optional) The scheduling strategy to use for the service. The valid values are REPLICA and DAEMON. Defaults to REPLICA. Note that Tasks using the Fargate launch type or the CODE_DEPLOY or EXTERNAL deployment controller types don't support the DAEMON scheduling strategy."
}

variable service_registries {
  type        = list(map(any))
  default     = []
  description = "(Optional) The service discovery registries for the service. The maximum number of service_registries blocks is 1."
}
