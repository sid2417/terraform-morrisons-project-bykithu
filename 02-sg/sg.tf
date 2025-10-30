module "sg_test" {
    # source = "../terraform-sg-bykithu" 
    source = "git::https://github.com/sid2417/terraform-sg-bykithu.git?ref=main"
    #vpc_id = "/${var.project_name}/${var.environment}/vpc-id"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    project_name = var.project_name
    common_tags = var.common_tags
    sg_description = var.sg_description

    ingress_block =  {
    ssh = {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
    http = {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
    https = {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
    db = {
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
    }


    egress_block =  {
    all_outbound  = {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    }
    }
    
}
