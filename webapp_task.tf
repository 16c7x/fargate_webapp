resource "aws_ecs_task_definition" "webapp2" {
  family                   = "webapp-task"
  network_mode             = "awsvpc"
  cpu                      = "512"
  memory                   = "1024"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = "arn:aws:iam::574184548053:role/ecsTaskExecutionRole"
  task_role_arn            = "arn:aws:iam::574184548053:role/ecsTaskExecutionRole"

container_definitions = jsonencode([
		{
			name      = "webapp"
			image     = "16c7x/webapp:latest"
            cpu       = 0		
            portMappings: [
                {
                    name: "webapp2-80",
                    containerPort: 80,
                    hostPort: 80,
                    protocol: "tcp",
                    appProtocol: "http"
                }
            ]
            essential = true
		}
	])
}