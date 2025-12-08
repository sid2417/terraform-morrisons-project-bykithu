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

variable "backend_tags" {
    type = map(string)
    default = {}
  
}


variable "frontend_tags" {
    type = map(string)
    default = {}
  
}

variable "ansible_tags" {
    type = map(string)
    default = {}
  
}


variable "zone_name" {
    type = string
    default = "kithusdairy.fun"
  
}


