resource "azurerm_policy_set_definition" "ApprovedVMExtensions-Initiative" {
  name         = "ApprovedVMExtensions-Initiative"
  policy_type  = "Custom"
  display_name = "ApprovedVMExtensions-Initiative"
  management_group_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg"
  parameters = file("${path.module}/initiative-parameters.json")

  #PCD-AddExtensions-Vm-Linx-AMA
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-AddExtensions-Vm-Linx-AMA"
    reference_id = "AddExtensions-Vm-Linx-AMA"
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-CommonParameter')]"}
      "amaVersion": {"value"= "[parameters('amaVersion-CommonParameter')]"}
      "dcrResourceId": {"value"= "[parameters('dcrResourceId-CommonParameter')]"}
      "userAssignedIdentityId": {"value"= "[parameters('userAssignedIdentityId-CommonParameter')]"}
    })
  }

  #PCD-AddExtensions-Vmss-Linx-AMA
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-AddExtensions-Vmss-Linx-AMA"
    reference_id = "AddExtensions-Vmss-Linx-AMA"
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-CommonParameter')]"}
      "amaVersion": {"value"= "[parameters('amaVersion-CommonParameter')]"}
      "dcrResourceId": {"value"= "[parameters('dcrResourceId-CommonParameter')]"}
      "userAssignedIdentityId": {"value"= "[parameters('userAssignedIdentityId-CommonParameter')]"}
    })
  }

  #PCD-AddExtensions-Vmss-Win-AMA
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-AddExtensions-Vmss-Win-AMA"
    reference_id = "AddExtensions-Vmss-Win-AMA"
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-CommonParameter')]"}
      "amaVersion": {"value"= "[parameters('amaVersion-CommonParameter')]"}
      "dcrResourceId": {"value"= "[parameters('dcrResourceId-CommonParameter')]"}
      "userAssignedIdentityId": {"value"= "[parameters('userAssignedIdentityId-CommonParameter')]"}
    })
  }

  #PCD-AddExtensions-Vm-Windows-AMA
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-AddExtensions-Vm-Windows-AMA"
    reference_id = "AddExtensions-Vm-Windows-AMA"
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-AddExtensions-Vm-Windows-AMA')]"}
      "amaVersion": {"value"= "[parameters('amaVersion-AddExtensions-Vm-Windows-AMA')]"}
      "dcrResourceId": {"value"= "[parameters('dcrResourceId-AddExtensions-Vm-Windows-AMA')]"}
      "userAssignedIdentityId": {"value"= "[parameters('userAssignedIdentityId-AddExtensions-Vm-Windows-AMA')]"}
    })
  }

}