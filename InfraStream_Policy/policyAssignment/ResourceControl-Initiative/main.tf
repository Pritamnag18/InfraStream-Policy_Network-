resource "azurerm_management_group_policy_assignment" "ResourceControl-Initiative" {
  name                 = "ResourceCtrl-Initiative" #Has a limit of 24 characters
  display_name         = "ResourceControl-Initiative"
  policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policySetDefinitions/ResourceControl-Initiative"
  #subscription_id      = "/subscriptions/f7b33f6a-5cf5-4826-9c31-2089d4779206"
  management_group_id      = var.management_group_id
  
  location = "eastus"
  identity {
    type="SystemAssigned"
    
  }
  parameters = jsonencode(
    {
      "blockListResourceTypes-BlockList-ResourceTypes": {"value": "${var.blockListResourceTypes-BlockList-ResourceTypes}"}
      "effect-BlockList-ResourceTypes": {"value": "${var.effect-BlockList-ResourceTypes}"} 
      "actionNames-Organization-Rsc-Protect-NetWatcher": {"value": "${var.actionNames-Organization-Rsc-Protect-NetWatcher}"}   
      "effect-Organization-Rsc-Protect-NetWatcher": {"value": "${var.effect-Organization-Rsc-Protect-NetWatcher}"}   
      "actionNames-Organization-Rsc-Protect-Rt-Udr": {"value": "${var.actionNames-Organization-Rsc-Protect-Rt-Udr}"}
      "effect-Organization-Rsc-Protect-Rt-Udr": {"value": "${var.effect-Organization-Rsc-Protect-Rt-Udr}"}   
      "protectedRoutesNames-Organization-Rsc-Protect-Rt-Udr": {"value": "${var.protectedRoutesNames-Organization-Rsc-Protect-Rt-Udr}"}  

    }
    )
}



