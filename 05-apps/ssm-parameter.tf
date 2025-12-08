resource "aws_ssm_parameter" "backend_private_ip" {
  name = "/${var.project_name}/${var.environment}/backend_private_ip"
  description = "Stores backend_private_ip for use in other modules"
  type  = "String"
  value = module.backend.private_ip
  overwrite = true 
}


resource "aws_ssm_parameter" "frontend_private_ip" {
  name = "/${var.project_name}/${var.environment}/frontend_private_ip"
  description = "Stores frontend_private_ip for use in other modules"
  type  = "String"
  value = module.frontend.private_ip
  overwrite = true 
}


resource "aws_ssm_parameter" "frontend_public_ip" {
  name = "/${var.project_name}/${var.environment}/frontend_public_ip"
  description = "Stores frontend_public_ip for use in other modules"
  type  = "String"
  value = module.frontend.public_ip
  overwrite = true 
}



#### Here backend_public_ip  not stored in SSM parameter
## Bcoz while developing the module we didn't allowed the public ips
### if you want public ips you must add associate_public_ip_address = true
## if we alloing true the traffic will comes from public ip also it is not security 
## so in our project instances are communicate with private address only
### so while storing in ssm parameter you will get error
## and this is not recommanded as per security 

# resource "aws_ssm_parameter" "backend_public_ip" {
#   name = "/${var.project_name}/${var.environment}/backend_public_ip"
#   description = "Stores backend_public_ip for use in other modules"
#   type  = "String"
#   value = module.backend.public_ip
#   overwrite = true 
# }
