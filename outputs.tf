output id {
  value       = aws_ecs_service.repo.id
  description = "The Amazon Resource Name (ARN) that identifies the service"
}

output name {
  value       = aws_ecs_service.repo.name
  description = "The name of the service"
}


output cluster {
  value       = aws_ecs_service.repo.cluster
  description = "The Amazon Resource Name (ARN) of cluster which the service runs on"
}

output iam_role {
  value       = aws_ecs_service.repo.iam_role
  description = "The ARN of IAM role used for ELB"
}

output desired_count {
  value       = aws_ecs_service.repo.desired_count
  description = " The number of instances of the task definition"
}
