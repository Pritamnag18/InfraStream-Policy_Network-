resource "azurerm_policy_definition" "PCD-StrAcCrosTenant" {
  name         = "PCD-StrAcCrosTenant"
  policy_type  = "Custom"
  mode         = "All"
management_group_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg"
  display_name = "PCD-StrAcCrosTenant"
  description  = "PCD-StrAcCrosTenant - Enforces disabling of cross tenant replication for storage accounts."
  policy_rule = jsonencode({
    "if": {
      "allOf": [
        {
          "equals": "Microsoft.Storage/storageAccounts",
          "field": "type"
        },
        {
          "field": "Microsoft.Storage/storageAccounts/allowCrossTenantReplication",
          "notEquals": "false"
        },
        {
          "not": {
            "allOf": [
              {
                "contains": "providers/Microsoft.MachineLearningServices/registries",
                "value": "[resourcegroup().managedBy]"
              },
              {
                "exists": true,
                "value": "[resourcegroup().managedBy]"
              }
            ]
          }
        }
      ]
    },
    "then": {
      "effect": "[parameters('effect')]"
    }
  })
  parameters = jsonencode({
    "effect": {
      "type": "String",
      "metadata": {
        "displayName": "Effect",
        "description": "Enable or disable the execution of the policy"
      },
      "allowedValues": [
        "Audit",
        "Disabled",
        "Deny"
      ],
      "defaultValue": "Deny"
    }
  })
}