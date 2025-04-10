resource "aws_ecs_service" "webapp" {
  name                 = "webapp-service"
  cluster              = aws_ecs_cluster.webapp.id
  task_definition      = aws_ecs_task_definition.webapp2.arn
  launch_type          = "FARGATE"
  desired_count        = 1
  force_new_deployment = true

  network_configuration {
    subnets          = aws_subnet.webapp_subnet[*].id
    security_groups  = [aws_security_group.webapp_sg.id]
    assign_public_ip = true
  }
  enable_execute_command = true 
}