resource "aws_ecs_service" "service" {
  name                               = var.name
  cluster                            = var.cluster
  task_definition                    = var.task_definition
  desired_count                      = var.desired_count
  deployment_maximum_percent         = var.deployment_maximum_percent
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  enable_ecs_managed_tags            = var.enable_ecs_managed_tags
  force_new_deployment               = var.force_new_deployment
  health_check_grace_period_seconds  = var.health_check_grace_period_seconds
  iam_role                           = var.iam_role
  launch_type                        = var.launch_type
  platform_version                   = var.platform_version

  deployment_controller {
    type = var.deployment_controller
  }

  dynamic "capacity_provider_strategy" {
    for_each = var.capacity_provider_strategy
    content {
      capacity_provider = lookup(var.capacity_provider_strategy, "capacity_provider", null)
      weight            = lookup(var.capacity_provider_strategy, "weight", null)
      base              = lookup(var.capacity_provider_strategy, "base", null)
    }
  }


  dynamic "load_balancer" {
    for_each = var.load_balancer
    content {

      elb_name         = lookup(var.load_balancer, "elb_name", null)
      target_group_arn = lookup(var.load_balancer, "target_group_arn", null)
      container_name   = lookup(var.load_balancer, "container_name", null)
      container_port   = lookup(var.load_balancer, "container_port", null)
    }
  }

  dynamic "network_configuration" {
    for_each = var.network_configuration
    content {

      subnets          = lookup(var.network_configuration, "subnets", null)
      security_groups  = lookup(var.network_configuration, "security_groups", null)
      assign_public_ip = lookup(var.network_configuration, "assign_public_ip", null)
    }
  }

  dynamic "ordered_placement_strategy" {
    for_each = var.ordered_placement_strategy
    content {

      type  = lookup(var.ordered_placement_strategy, "type", null)
      field = lookup(var.ordered_placement_strategy, "field", null)

    }
  }

  dynamic "placement_constraints" {
    for_each = var.placement_constraints
    content {
      type       = lookup(var.placement_constraints, "type", null)
      expression = lookup(var.placement_constraints, "expression", null)
    }
  }

  dynamic "service_registries" {
    for_each = var.service_registries
    content {
      registry_arn   = lookup(var.service_registries, "registry_arn", null)
      port           = lookup(var.service_registries, "port", null)
      container_port = lookup(var.service_registries, "container_port", null)
      container_name = lookup(var.service_registries, "container_name", null)
    }
  }
  tags = var.tags
}