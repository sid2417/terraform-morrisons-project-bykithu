module "backend" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.environment}-backend"
  vpc_security_group_ids = [data.aws_ssm_parameter.backend_sg_id.value]  # This is List
  instance_type = "t3.micro"

  # convert StringList to list and get first element
  subnet_id     = element(split(",",data.aws_ssm_parameter.private_subnet_ids.value), 0) 
  ami = data.aws_ami.morrisons-ami.id
  tags = merge(
          var.common_tags, 
          var.backend_tags, 
          {Name = "${var.project_name}-${var.environment}-backend"}
  )
}


module "frontend" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.environment}-frontend"
  vpc_security_group_ids = [data.aws_ssm_parameter.frontend_sg_id.value]  # This is List
  instance_type = "t3.micro"

  # convert StringList to list and get first element
  subnet_id     = element(split(",",data.aws_ssm_parameter.public_subnet_ids.value), 0) 
  ami = data.aws_ami.morrisons-ami.id
  tags = merge(
          var.common_tags, 
          var.frontend_tags, 
          {Name = "${var.project_name}-${var.environment}-frontend"}
  )
}



module "ansible" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.environment}-ansible"
  vpc_security_group_ids = [data.aws_ssm_parameter.ansible_sg_id.value]  # This is List
  instance_type = "t3.micro"

  # convert StringList to list and get first element
  subnet_id     = element(split(",",data.aws_ssm_parameter.public_subnet_ids.value), 0) 
  ami = data.aws_ami.morrisons-ami.id
  user_data = file("morrisons.sh")
  tags = merge(
          var.common_tags, 
          var.ansible_tags, 
          {Name = "${var.project_name}-${var.environment}-ansible"}
  )

  depends_on = [ module.backend, module.frontend, module.records ]
}





module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = var.zone_name  # this is parent-domain

  records = [
    {
      name    = "backend"  # this is considered as sub-domain
      type    = "A"
      ttl     = 1
      records = [
        module.backend.private_ip
        
      ]
      
    },
    {
      name    = "frontend"  # this is considered as sub-domain
      type    = "A"
      ttl     = 1
      records = [
        module.frontend.private_ip
        
      ]
      
    },
    {
      name    = ""  # kithusdairy.fun  ## Here we meniton empty so its take default
      type    = "A"
      ttl     = 1
      records = [
        module.frontend.public_ip
        
      ]
      
    }
  ]
}