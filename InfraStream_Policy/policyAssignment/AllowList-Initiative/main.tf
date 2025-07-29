
resource "azurerm_management_group_policy_assignment" "AllowList-Initiative" {
  name                 = "AllowList-Initiative"
  policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policySetDefinitions/AllowList-Initiative"
  #subscription_id      = "/subscriptions/f7b33f6a-5cf5-4826-9c31-2089d4779206"
  management_group_id      = var.management_group_id
  location = "eastus"
  identity {
    type="SystemAssigned"
  }
  parameters = jsonencode(
    {
      "listOfAllowedLocations-AllowedLocationsForResourceGroups": {"value": "${var.listOfAllowedLocations-AllowedLocationsForResourceGroups}"}
      "effect-AllowedLocationsForResourceGroups": {"value": "${var.effect-AllowedLocationsForResourceGroups}"}
      "listOfAllowedLocations-AllowedLocationsForResources": {"value": "${var.listOfAllowedLocations-AllowedLocationsForResources}"}
      "effect-AllowedLocationsForResources": {"value": "${var.effect-AllowedLocationsForResources}"}
      "effect-AllowListWinServerLicenceVmss": {"value": "${var.effect-AllowListWinServerLicenceVmss}"}
      "effect-AllowList-UbuntuServerSKUs": {"value": "${var.effect-AllowList-UbuntuServerSKUs}"}
      "effect-AllowList-RHELServerSKUs": {"value": "${var.effect-AllowList-RHELServerSKUs}"}
      "effect-AllowList-WinServerSKUs": {"value": "${var.effect-AllowList-WinServerSKUs}"}
      "effect-AllowList-ResourceTypes": {"value": "${var.effect-AllowList-ResourceTypes}"}
      "effect-PIP-LimitSvcs": {"value": "${var.effect-PIP-LimitSvcs}"}         
      "allowListResourceTypesForAppTeam": {"value": "${var.allowListResourceTypesForAppTeams}"}
      "allowListResourceTypesPlatform": {"value": "${var.allowListResourceTypesPlatform}"}
      "allowListRscProvidersPlatform": {"value": "${var.allowListRscProvidersPlatform}"}     
    }
    )
}


