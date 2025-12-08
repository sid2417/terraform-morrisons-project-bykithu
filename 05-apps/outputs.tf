output "backend_public_ip" {
    value = module.backend.public_ip
  
}

output "backend_private_ip" {
    value = module.backend.private_ip
  
}

output "frontend_public_ip" {
    value = module.frontend.public_ip
  
}

output "frontend_private_ip" {
    value = module.frontend.private_ip
  
}