resource "azurerm_policy_set_definition" "CompliantSKUs-Initiative" {
  name         = "CompliantSKUs-Initiative"
  policy_type  = "Custom"
  display_name = "CompliantSKUs-Initiative"
  management_group_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg"
  parameters = file("${path.module}/initiative-parameters.json")

  #API Management service should use a SKU that supports virtual networks
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/73ef9241-5d81-4cd4-b483-8443d1730fe5"
    reference_id = "CompliantSKUsAPIManagementServiceVnet"
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-CompliantSKUsAPIManagementServiceVnet')]"}
      "listOfAllowedSKUs": {"value"= "[parameters('listOfAllowedSKUs-CompliantSKUsAPIManagementServiceVnet')]"}
    })
  }

  #App Configuration should use a SKU that supports private link
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/89c8a434-18f0-402c-8147-630a8dea54e0"
    reference_id = "CompliantSKUsAppConfigUsePrivateLink"
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-CompliantSKUsAppConfigUsePrivateLink')]"}
    })
  }

  #App Service apps should use a SKU that supports private link
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/546fe8d2-368d-4029-a418-6af48a7f61e5"
    reference_id = "CompliantSKUsAppServiceAppUsePrivateLink"
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-CompliantSKUsAppServiceAppUsePrivateLink')]"}
    })
  }

  
  #Azure Cognitive Search service should use a SKU that supports private link
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a049bf77-880b-470f-ba6d-9f21c530cf83"
    reference_id = "CompliantSKUsAzureCognitiveSearchUsePrivateLink"
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-CompliantSKUsAzureCognitiveSearchUsePrivateLink')]"}
    })
  }

  #Container registries should have SKUs that support Private Links
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/bd560fc0-3c69-498a-ae9f-aa8eb7de0e13"
    reference_id = "CompliantSKUsContainerRegistriesUsePrivateLink"
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-CompliantSKUsContainerRegistriesUsePrivateLink')]"}
    })
  }

  #PCD-NonCompliantSKU-Eventhub
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-NonCompliantSKU-Eventhub"
    reference_id = "CompliantSKUsPCDNonCompliantSKUEventHub"
    parameter_values     = jsonencode(
    {
      "allowedSkuNames": {"value"= "[parameters('allowedSkuNames-CompliantSKUsPCDNonCompliantSKUEventHub')]"}
      "effect": {"value"= "[parameters('effect-CompliantSKUsPCDNonCompliantSKUEventHub')]"}
    })
  }

  #PCD-NonCompliantSKUsAGW
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-NonCompliantSKUsAGW"
    reference_id = "CompliantSKUsPCDNonCompliantSKUsAGW"
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-CompliantSKUsPCDNonCompliantSKUsAGW')]"}
    })
  }

  #Storage accounts should be limited by allowed SKUs
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/7433c107-6db4-4ad1-b57a-a76dce0154a1"
    reference_id = "CompliantSKUsStrAccountLimitAllowedSKUs"
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-CompliantSKUsStrAccountLimitAllowedSKUs')]"}
      "listOfAllowedSKUs": {"value"= "[parameters('listOfAllowedSKUs-CompliantSKUsStrAccountLimitAllowedSKUs')]"}
    })
  }

  #PCD-DenyNon-premiumDatabricksSku
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-DenyNon-premiumDatabricksSku"
    reference_id = "DenyNonPremiumDatabricks"
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-DenyNonPremiumDatabricks')]"}
    })
  }
  

}