resource "azurerm_management_group_policy_assignment" "CompliantSKUs-Initiative" {
  name                 = "CompliantSKUs-Initiative" #Has a limit of 24 characters
  display_name         = "CompliantSKUs-Initiative"
  policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policySetDefinitions/CompliantSKUs-Initiative"
  #subscription_id      = "/subscriptions/f7b33f6a-5cf5-4826-9c31-2089d4779206"
  management_group_id      = var.management_group_id
  
  location = "eastus"
  identity {
    type="SystemAssigned"
    
  }
  parameters = jsonencode(
    {
      "effect-CompliantSKUsAPIManagementServiceVnet": {"value": "${var.effect-CompliantSKUsAPIManagementServiceVnet}"}
      "listOfAllowedSKUs-CompliantSKUsAPIManagementServiceVnet": {"value": "${var.listOfAllowedSKUs-CompliantSKUsAPIManagementServiceVnet}"} 
      "effect-CompliantSKUsAppConfigUsePrivateLink": {"value": "${var.effect-CompliantSKUsAppConfigUsePrivateLink}"}   
      "effect-CompliantSKUsAppServiceAppUsePrivateLink": {"value": "${var.effect-CompliantSKUsAppServiceAppUsePrivateLink}"}   
      "effect-CompliantSKUsAzureCognitiveSearchUsePrivateLink": {"value": "${var.effect-CompliantSKUsAzureCognitiveSearchUsePrivateLink}"}
      "effect-CompliantSKUsContainerRegistriesUsePrivateLink": {"value": "${var.effect-CompliantSKUsContainerRegistriesUsePrivateLink}"}   
      "allowedSkuNames-CompliantSKUsPCDNonCompliantSKUEventHub": {"value": "${var.allowedSkuNames-CompliantSKUsPCDNonCompliantSKUEventHub}"}
      "effect-CompliantSKUsPCDNonCompliantSKUEventHub": {"value": "${var.effect-CompliantSKUsPCDNonCompliantSKUEventHub}"}
      "effect-CompliantSKUsPCDNonCompliantSKUsAGW": {"value": "${var.effect-CompliantSKUsPCDNonCompliantSKUsAGW}"}
      "effect-CompliantSKUsStrAccountLimitAllowedSKUs": {"value": "${var.effect-CompliantSKUsStrAccountLimitAllowedSKUs}"}
      "effect-DenyNonPremiumDatabricks": {"value": "${var.effect-DenyNonPremiumDatabricks}"}
      "listOfAllowedSKUs-CompliantSKUsStrAccountLimitAllowedSKUs": {"value": "${var.listOfAllowedSKUs-CompliantSKUsStrAccountLimitAllowedSKUs}"}  

    }
    )
    
}




