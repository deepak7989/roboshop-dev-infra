resource "aws_ssm_parameter" "sg_id" {
  name  = "/${var.project}/${var.environment}/mysql_root_password"
  type  = "SecureString"
  value = varr.mysql_root_password
  overwrite = true
}