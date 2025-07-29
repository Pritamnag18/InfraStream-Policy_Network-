resource "azurerm_policy_set_definition" "AllowList-Initiative" {
  name         = "AllowList-Initiative"
  policy_type  = "Custom"
  display_name = "AllowList-Initiative"
  management_group_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg"
  parameters = file("${path.module}/initiative-parameters.json")

  #PCD-AllowedLocationsForResourceGroups
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-AllowedLocationsForResourceGroups"
    reference_id = "AllowedLocationsForResourceGroups"
    parameter_values     = jsonencode(
    {
      "listOfAllowedLocations": {"value"= "[parameters('listOfAllowedLocations-AllowedLocationsForResourceGroups')]"},
      "effect": {"value"= "[parameters('effect-AllowedLocationsForResourceGroups')]"}
    })
  }

  #PCD-AllowedLocationsForResources
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-AllowedLocationsForResources"
    reference_id = "AllowedLocationsForResources"
    parameter_values     = jsonencode(
    {
      "listOfAllowedLocations": {"value"= "[parameters('listOfAllowedLocations-AllowedLocationsForResources')]"},
      "effect": {"value"= "[parameters('effect-AllowedLocationsForResources')]"}
    })
  }
  #PCD-AllowList-WinServer-Licence
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-AllowList-WinServer-Licence"
    reference_id = "AllowListWinServerLicenceVmss"
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-AllowListWinServerLicenceVmss')]"}
    })
  }

 #PCD-AllowList-UbuntuServerSKUs
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-AllowList-UbuntuServerSKUs"
    reference_id = "AllowList-UbuntuServerSKUs"
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-AllowList-UbuntuServerSKUs')]"}
    })
  }

   #PCD-AllowList-RHELServerSKUs
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-AllowList-RHELServerSKUs"
    reference_id = "AllowList-RHELServerSKUs"
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-AllowList-RHELServerSKUs')]"}
    })
  }
   #PCD-AllowList-WinServerSKUs
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-AllowList-WinServerSKUs"
    reference_id = "AllowList-WinServerSKUs"
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-AllowList-WinServerSKUs')]"}
    })
  }
   #PCD-AllowList-ResourceTypes
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-AllowList-ResourceTypes"
    reference_id = "AllowList-ResourceTypes"
    parameter_values     = jsonencode(
    {
      "allowListResourceTypesForAppTeam": {"value"= "[parameters('allowListResourceTypesForAppTeam')]"}
      "allowListResourceTypesPlatform": {"value"= "[parameters('allowListResourceTypesPlatform')]"}
      "allowListRscProvidersPlatform": {"value"= "[parameters('allowListRscProvidersPlatform')]"}
      "effect": {"value"= "[parameters('effect-AllowList-ResourceTypes')]"}
    })
  }
  #PCD-PIP-LimitSvcs
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-PIP-LimitSvcs"
    reference_id = "PIP-LimitSvcs"
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-PIP-LimitSvcs')]"}
    })
  }
}