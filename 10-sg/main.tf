module "sg" {
  count = length(var.sg_names)
  source      = "git::https://github.com/deepak7989/terraform-aws-sg.git?ref=main"
  project     = var.project
  environment = var.environment
  component   = var.component
  vpc_id      = local.vpc_id
  sg_name     = replace(var.sg_names[count.index], "_", "-")
}