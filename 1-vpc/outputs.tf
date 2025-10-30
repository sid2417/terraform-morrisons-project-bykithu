output "az_names" {
    value = module.morrisons_vpc.az_info
  
}

output "default_vpc_info" {
    value = module.morrisons_vpc.default_vpc
  
}

output "morrisons_vpc_id" {
    value = module.morrisons_vpc.main_vpc_id
  
}