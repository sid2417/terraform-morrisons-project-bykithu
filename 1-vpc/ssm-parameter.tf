resource "aws_ssm_parameter" "vpc_id" {
  #name  = "/morrisons/dev/vpc-id"
  name = "/${var.project_name}/${var.environment}/vpc-id"
  description = "Stores VPC ID for use in other modules"
  type  = "String"
  value = module.morrisons_vpc.main_vpc_id  ## here we are refferring from outputs.tf file in morrisons_vpc module 
  overwrite = true # By default, Terraform doesn’t overwrite existing SSM parameters (for safety)
}