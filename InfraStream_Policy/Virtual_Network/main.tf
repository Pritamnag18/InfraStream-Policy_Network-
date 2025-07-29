
locals {
  full_name  = "${var.app_name}-${var.environment_name}-${var.region_name}"
  full_name1 = "${var.app_name}-${var.win_os_name}-${var.environment_name}-${var.region_name}"
  full_name2 = "${var.app_name}-${var.win_os_name}-${var.environment_name1}-${var.region_name}"
  full_name3  = "${var.app_name}-${var.environment_name1}-${var.region_name}"
  full_name4 = "${var.app_name}-${var.lin_os_name}-${var.environment_name}-${var.region_name}"
  full_name5 = "${var.app_name}-${var.lin_os_name}-${var.environment_name1}-${var.region_name}"
  full_name6  = "${var.app_name}${var.environment_name}${var.region_name}"
  full_name7  = "${var.app_name}${var.environment_name1}${var.region_name}"
  full_name8  = "${var.app_name}${var.region_name}"
  full_name9  = "${var.app_name}-${var.region_name}"
  default_tags = {
    app_name        = var.app_name
    environment_name = var.environment_name
    region_name = var.region_name
    win_os_name = var.win_os_name
    lin_os_name = var.lin_os_name
    environment_name1 = var.environment_name1
    Description      = "Resource Terraform for ${local.full_name}"
    Description1     = "Resource Terraform for ${local.full_name1}"
    Description2     = "Resource Terraform for ${local.full_name2}"
    Description3     = "Resource Terraform for ${local.full_name3}"
    Description4     = "Resource Terraform for ${local.full_name4}"
    Description5     = "Resource Terraform for ${local.full_name5}"
    Description6     = "Resource Terraform for ${local.full_name6}"
    Description7     = "Resource Terraform for ${local.full_name7}"
    Description8     = "Resource Terraform for ${local.full_name8}"
    Description9     = "Resource Terraform for ${local.full_name9}"
    Terraform        = "true"
  }
}


#_________________________________________________________________________________________________________________________________________________________________

# resource group  
#prod
module "azurerm_resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = "rg-${local.full_name}-01"   
  location            = var.rg_location
}
#dev
module "azurerm_resource_group_dev" {
  source              = "./modules/resource_group"
  resource_group_name = "rg-${local.full_name3}-01"     
  location            = var.rg_location
}
#prod_vnet
module "azurerm_resource_group_vnet" {
  source              = "./modules/resource_group"
  resource_group_name = "rg-vnet-${local.full_name}-02"     
  location            = var.rg_location
}
#dev_vnet
module "azurerm_resource_group_vnet_dev" {
  source              = "./modules/resource_group"
  resource_group_name = "rg-vnet-${local.full_name3}-02"     
  location            = var.rg_location
}
#tfstate
module "azurerm_resource_group_tfstate" {
  source              = "./modules/resource_group"
  resource_group_name = "rg-${local.full_name9}-03"   
  location            = var.rg_location
}
#_________________________________________________________________________________________________________________________________________________________________
#Virtual_network
#prod
module "azurerm_virtual_network" {
  source = "./modules/Virtual_Network"
  resource_group_name =  module.azurerm_resource_group.resource_group_name
  location =  module.azurerm_resource_group.resource_group_location
  virtual_network_name =   "vnet-${local.full_name}-01"
  vnet_address_space = var.vnet_address_space
}

#Virtual_network
#dev
module "azurerm_virtual_network_dev" {
  source = "./modules/Virtual_Network"
  resource_group_name =  module.azurerm_resource_group_dev.resource_group_name
  location =  module.azurerm_resource_group_dev.resource_group_location
  virtual_network_name =   "vnet-${local.full_name3}-01"
  vnet_address_space = var.vnet_address_space_dev
}

#________________________________________________________________________________________________________________________________________________________________
#Subnet
resource "azurerm_subnet" "subnet_pep" {
  name                 = "snet-pep-${local.full_name}-01"
  resource_group_name  = module.azurerm_virtual_network.vnet_rg
  virtual_network_name = module.azurerm_virtual_network.vnet_name
  address_prefixes = var.address_prefixes_pep
  service_endpoints    = var.service_endpoints_pep
}
#________________________________________________________________________________________________________________________________________________________________
#storage_account
module "azurerm_storage_account_tfstate" {
  source                   = "./modules/storage_account"
  depends_on               = [azurerm_subnet.subnet_pep]
  storage_account_name     = "stgtfs${local.full_name8}01"
  resource_group_name      = module.azurerm_resource_group_tfstate.resource_group_name
  location                 = module.azurerm_resource_group_tfstate.resource_group_location
  account_replication_type = var.st_account_replication_type
  account_kind             = var.st_account_kind 
  endpoint_name            = "pep-stg-tfs-${local.full_name8}-01"
  service_connection_name  = "pvtsc-stg-tfs-${local.full_name8}-01"
  vnet_name                = module.azurerm_virtual_network.vnet_name
  resource_group_name1     = module.azurerm_virtual_network.vnet_rg
  snet_name                = azurerm_subnet.subnet_pep.name
  stg_container_name       = "cont${local.full_name8}01"
}
#________________________________________________________________________________________________________________________________________________________________
resource "time_sleep" "wait_for_vnet" {
  create_duration = var.sleep_create_duration
  depends_on      = [module.azurerm_resource_group, module.azurerm_resource_group_dev, module.azurerm_virtual_network, module.azurerm_virtual_network_dev]
}
#________________________________________________________________________________________________________________________________________________________________