module "morrisons_vpc" {
    source = "../../terraform-vpc-bykithu"
    common_tags = var.common_tags
    project_name = "morrisons"
    public_subnets_cidrs = var.public_subnets_cidrs
    private_subnets_cidrs = var.private_subnets_cidrs
    database_subnets_cidrs = var.database_subnets_cidrs
    is_peering_required = var.is_peering_required

  
}