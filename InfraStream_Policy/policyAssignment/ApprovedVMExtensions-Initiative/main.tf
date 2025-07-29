resource "azurerm_management_group_policy_assignment" "ApprovedVMExtensions-Initiative" {
  name                 = "VMExtensions-Initiative" #Has a limit of 24 characters
  display_name         = "ApprovedVMExtensions-Initiative"
  policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policySetDefinitions/ApprovedVMExtensions-Initiative"
  #subscription_id      = "/subscriptions/f7b33f6a-5cf5-4826-9c31-2089d4779206"
  management_group_id      = var.management_group_id
  
  location = "eastus"
  identity {
    type="SystemAssigned"
    
  }
  parameters = jsonencode(
    {
      "amaVersion-CommonParameter": {"value": "${var.amaVersion-CommonParameter}"}
      "dcrResourceId-CommonParameter": {"value": "${var.dcrResourceId-CommonParameter}"}
      "effect-CommonParameter": {"value": "${var.effect-CommonParameter}"}
      "userAssignedIdentityId-CommonParameter": {"value": "${var.userAssignedIdentityId-CommonParameter}"}
      "amaVersion-AddExtensions-Vm-Windows-AMA": {"value": "${var.amaVersion-AddExtensions-Vm-Windows-AMA}"}
      "dcrResourceId-AddExtensions-Vm-Windows-AMA": {"value": "${var.dcrResourceId-AddExtensions-Vm-Windows-AMA}"}
      "effect-AddExtensions-Vm-Windows-AMA": {"value": "${var.effect-AddExtensions-Vm-Windows-AMA}"}
      "userAssignedIdentityId-AddExtensions-Vm-Windows-AMA": {"value": "${var.userAssignedIdentityId-AddExtensions-Vm-Windows-AMA}"}
                   
    }
    )
}


