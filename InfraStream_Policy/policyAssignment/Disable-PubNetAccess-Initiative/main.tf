resource "azurerm_management_group_policy_assignment" "Disable-PubNetAccess-Initiative" {
  name                 = "Disable-PNA-Initiative" #Has a limit of 24 characters
  display_name         = "Disable-PubNetAccess-Initiative"
  policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policySetDefinitions/Disable-PubNetAccess-Initiative"
  #subscription_id      = "/subscriptions/f7b33f6a-5cf5-4826-9c31-2089d4779206"
  management_group_id      = var.management_group_id
  
  location = "eastus"
  identity {
    type="SystemAssigned"
    
  }
  parameters = jsonencode(
    {
      "effect-AppServiceVnetRouteAllPolicy": {"value": "${var.effect-AppServiceVnetRouteAllPolicy}"}   
      "effect-DisablePNAAppServiceSlots": {"value": "${var.effect-DisablePNAAppServiceSlots}"}
      "effect-DisableFunctionAppSlotsPublicNetwork": {"value": "${var.effect-DisableFunctionAppSlotsPublicNetwork}"}
      "effect-PCDBlockStrAccPAc": {"value": "${var.effect-PCDBlockStrAccPAc}"}
      "effect-DisableVNetPNAAppServiceSlot": {"value": "${var.effect-DisableVNetPNAAppServiceSlot}"}
      "effect-DisableStoragePublicAccess": {"value": "${var.effect-DisableStoragePublicAccess}"}
      "effect-EnableVNetAAppServiceslots": {"value": "${var.effect-EnableVNetAAppServiceslots}"}
      "effect-InjectVNetAAppService": {"value": "${var.effect-InjectVNetAAppService}"}
      "effect-EnableVNetAAppServiceRouting": {"value": "${var.effect-EnableVNetAAppServiceRouting}"}
      "effect-ReachablePNAppService": {"value": "${var.effect-ReachablePNAppService}"}
      "effect-EanbleCosmosDBAccountsFW": {"value": "${var.effect-EanbleCosmosDBAccountsFW}"}
      "effect-DisableEGNanespacePublicNetwork": {"value": "${var.effect-DisableEGNanespacePublicNetwork}"}
      "effect-EnableAZKeyVaultFW": {"value": "${var.effect-EnableAZKeyVaultFW}"}
      "effect-DisableAZMGrafanaPublicNetwork": {"value": "${var.effect-DisableAZMGrafanaPublicNetwork}"}
      "effect-UseVetInjectonContainerApp": {"value": "${var.effect-UseVetInjectonContainerApp}"}
      "effect-DisableContainerAppPublicNetwork": {"value": "${var.effect-DisableContainerAppPublicNetwork}"}
      "effect-DisableAppServiceSlotsVnetRouteAllPolicy": {"value": "${var.effect-DisableAppServiceSlotsVnetRouteAllPolicy}"}
      "effect-DisableAppServiceVnetRouteAllPolicy": {"value": "${var.effect-DisableAppServiceVnetRouteAllPolicy}"}
      "effect-BlockPublicKeyVaults": {"value": "${var.effect-BlockPublicKeyVaults}"}
      "effect-DisablePublicNetPostgresFlex": {"value": "${var.effect-DisablePublicNetPostgresFlex}"}
      "effect-PCDDisablePNAEventHub": {"value": "${var.effect-PCDDisablePNAEventHub}"}
      "effect-PCDEnableFunctionAppConfRoutingVnetPolicy": {"value": "${var.effect-PCDEnableFunctionAppConfRoutingVnetPolicy}"}
      "effect-PCDEnableFunctionAppSlotsRoutingVnetPolicy": {"value": "${var.effect-PCDEnableFunctionAppSlotsRoutingVnetPolicy}"}
      "effect-PCDEnableFunctionAppSlotsVnetRouteAllPolicy": {"value": "${var.effect-PCDEnableFunctionAppSlotsVnetRouteAllPolicy}"}
      "effect-PCDEnableFunctionAppVnetRouteAllPolicy": {"value": "${var.effect-PCDEnableFunctionAppVnetRouteAllPolicy}"}
      "effect-PCDDisableCosmosDbPNA": {"value": "${var.effect-PCDDisableCosmosDbPNA}"}
      "effect-PCDPrivateEnspointConfigRedisEnterprisePNA": {"value": "${var.effect-PCDPrivateEnspointConfigRedisEnterprisePNA}"}
      "effect-DisableAzureSQLDbPNA": {"value": "${var.effect-DisableAzureSQLDbPNA}"}
      "effect-DisableAzureFileSyncPNA": {"value": "${var.effect-DisableAzureFileSyncPNA}"}
      "effect-DisableBatchAcoountPNA": {"value": "${var.effect-DisableBatchAcoountPNA}"}
      "effect-DisableMSSQLflexibleServersPNA": {"value": "${var.effect-DisableMSSQLflexibleServersPNA}"}
      "effect-DisablePostgreSQLflexibleServersPNA": {"value": "${var.effect-DisablePostgreSQLflexibleServersPNA}"}
      "effect-DisablePostgreSQLServersPNA": {"value": "${var.effect-DisablePostgreSQLServersPNA}"}
      "effect-RestrictStrAccountNetworkAccess": {"value": "${var.effect-RestrictStrAccountNetworkAccess}"}
      "effect-RestrictStrAccountVNetRule": {"value": "${var.effect-RestrictStrAccountVNetRule}"}
      "effect-AppServiceAppsPNA": {"value": "${var.effect-AppServiceAppsPNA}"}
      "effect-FunctionAppsPNA": {"value": "${var.effect-FunctionAppsPNA}"}
      "effect-DenyPublicIPsForDatabricksCluster": {"value": "${var.effect-DenyPublicIPsForDatabricksCluster}"}                 
    }
    )
}


