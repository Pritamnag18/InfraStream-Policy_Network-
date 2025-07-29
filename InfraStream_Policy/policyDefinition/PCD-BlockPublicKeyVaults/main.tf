resource "azurerm_policy_definition" "PCD-BlockPublicKeyVaults" {
  name         = "PCD-BlockPublicKeyVaults"
  policy_type  = "Custom"
  mode         = "All"
management_group_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg"
  display_name = "PCD-BlockPublicKeyVaults"
  description  = "Ensures that public network access is disabled for Azure Key Vaults."

  policy_rule = jsonencode({
    if = {
      allOf = [
        {
          field = "type",
          equals = "Microsoft.KeyVault/vaults"
        },
        {
          field = "Microsoft.KeyVault/vaults/publicNetworkAccess",
          equals = "enabled"
        }
      ]
    },
    then = {
      effect = "[parameters('effect')]"
    }
  })

  parameters = jsonencode({
    effect = {
      type        = "String"
      metadata    = {
        displayName = "Effect"
        description = "Enable or disable the execution of the policy"
      }
      allowedValues = ["Audit", "Deny", "Disabled"]
      defaultValue  = "Deny"
    }
  })

  metadata = jsonencode({
    version   = "1.0.0"
    category  = "Key Vault"
  })
}