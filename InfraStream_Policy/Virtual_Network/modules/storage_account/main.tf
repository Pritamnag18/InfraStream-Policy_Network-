
data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name1
}

data "azurerm_subnet" "snet"{
   name = var.snet_name
  resource_group_name = data.azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
}
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind
  public_network_access_enabled   = false
  cross_tenant_replication_enabled = false
  allow_nested_items_to_be_public = false


  
    network_rules {
      default_action             = "Deny"
      bypass                     = ["None"]
      virtual_network_subnet_ids = [data.azurerm_subnet.snet.id]
  }
}

resource "azurerm_private_endpoint" "endpoint" {
  depends_on = [ azurerm_storage_account.storage ]
  name                = var.endpoint_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = data.azurerm_subnet.snet.id

  private_service_connection {
    name                           = var.service_connection_name
    private_connection_resource_id = azurerm_storage_account.storage.id 
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
}

resource "time_sleep" "wait_for_vnet" {
  create_duration = "2500s"
  depends_on      = [azurerm_storage_account.storage,azurerm_private_endpoint.endpoint]
}

resource "azurerm_storage_container" "storage_container" {
  name                  = var.stg_container_name
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"
  depends_on = [ time_sleep.wait_for_vnet ]
}