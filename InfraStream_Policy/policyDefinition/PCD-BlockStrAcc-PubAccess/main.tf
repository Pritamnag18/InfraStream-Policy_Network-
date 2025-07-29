resource "azurerm_policy_definition" "PCD-BlockStrAcc-PubAccess" {
  name         = "PCD-BlockStrAcc-PubAccess"
  policy_type  = "Custom"
  mode         = "All"
management_group_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg"
  display_name = "PCD-BlockStrAcc-PubAccess"
  description  = "Ensures that public access is not allowed for Azure Storage Accounts unless they are part of certain resource groups."

  policy_rule = jsonencode({
    if = {
      allOf = [
        {
          field = "type",
          equals = "Microsoft.Storage/storageAccounts"
        },
        {
          not = {
            allOf = [
              {
                field = "id",
                contains = "/resourceGroups/aro-"
              },
              {
                anyOf = [
                  {
                    field = "name",
                    like = "cluster*"
                  },
                  {
                    field = "name",
                    like = "imageregistry*"
                  }
                ]
              }
            ]
          }
        },
        {
          not = {
            field = "Microsoft.Storage/storageAccounts/allowBlobPublicAccess",
            equals = "false"
          }
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
        description = "The effect determines what happens when the policy rule is evaluated to match."
      }
      allowedValues = ["audit", "Audit", "deny", "Deny", "disabled", "Disabled"]
      defaultValue  = "Deny"
    }
  })

  metadata = jsonencode({
    version   = "1.0.0"
    category  = "Storage"
  })
}