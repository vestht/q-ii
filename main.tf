module "networking" {
    source = "./modules/networking"
}

module "compute" {
    source = "./modules/compute"
    instance_1a_subnet_id = module.networking.instance_1a_subnet_id
    instance_1a_security_group_id = module.networking.instance_1a_security_group_id
}
