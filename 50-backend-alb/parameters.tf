resource "aws_ssm_parameter" "backend_alb_listener_arn" {
  name  = "/${var.project}/${var.environment}/backend_alb_listener_arn" # /roboshop/dev/mongodb_sg_id
  type  = "String"
  value = aws_lb_listener.http.arn
  overwrite = true
}