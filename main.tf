module "networking" {
    source = "./modules/networking"
}

module "compute" {
    source = "./modules/compute"
    instance_1a_nic_0_id = module.networking.instance_1a_nic_0_id
}
