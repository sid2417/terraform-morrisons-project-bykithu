variable "project_name" {
    type = string
    default = "morrisons"
  
}

variable "environment" {
    default = "dev"
  
}

variable "common_tags" {
    type = map(string)
    default = {
      Project = "morrisons"
      Environment = "Dev"
      Terraform = true
    }

  
}

variable "sg_description" {
    type = string
    default = "We are allowing inbound and outbound very specifically few ports only"

}

