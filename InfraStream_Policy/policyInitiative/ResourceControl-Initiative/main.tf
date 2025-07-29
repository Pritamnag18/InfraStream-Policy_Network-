resource "azurerm_policy_set_definition" "ResourceControl-Initiative" {
  name         = "ResourceControl-Initiative"
  policy_type  = "Custom"
  display_name = "ResourceControl-Initiative"
  management_group_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg"
  parameters = file("${path.module}/initiative-parameters.json")

  #PCD-BlockList-ResourceTypes
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-BlockList-ResourceTypes"
    reference_id = "BlockList-ResourceTypes"
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-BlockList-ResourceTypes')]"},
      "blockListResourceTypes": {"value"= "[parameters('blockListResourceTypes-BlockList-ResourceTypes')]"}
    })
  }

  #PCD-Organization-Rsc-Protect-NetWatcher
policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-Organization-Rsc-Protect-NetWatcher"
    reference_id = "Organization-Rsc-Protect-NetWatcher"
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-Organization-Rsc-Protect-NetWatcher')]"},
      "actionNames": {"value"= "[parameters('actionNames-Organization-Rsc-Protect-NetWatcher')]"}
    })
  }

  #PCD-Organization-Rsc-Protect-Rt-Udr
policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-Organization-Rsc-Protect-Rt-Udr"
    reference_id = "Organization-Rsc-Protect-Rt-Udr"
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-Organization-Rsc-Protect-Rt-Udr')]"},
      "actionNames": {"value"= "[parameters('actionNames-Organization-Rsc-Protect-Rt-Udr')]"},
      "protectedRoutesNames": {"value"= "[parameters('protectedRoutesNames-Organization-Rsc-Protect-Rt-Udr')]"}
    })
  }

    
}