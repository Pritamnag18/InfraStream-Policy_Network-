resource "azurerm_policy_definition" "PCD-AppServiceAppsPNA" {
  name         = "PCD-AppServiceAppsPNA"
  policy_type  = "Custom"
  mode         = "All"
  management_group_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg"
  display_name = "PCD-AppServiceAppsPNA"
  description  = "Ensures that local authentication is disabled for App services."
  policy_rule = jsonencode({
    "if": {
      "allOf": [
        {
          "equals": "Microsoft.Web/sites",
          "field": "type"
        },
        {
          "field": "kind",
          "notContains": "functionapp"
        },
        {
          "exists": "false",
          "field": "Microsoft.Web/sites/hostingEnvironmentProfile.id"
        },
        {
          "anyOf": [
            {
              "exists": "false",
              "field": "Microsoft.Web/sites/publicNetworkAccess"
            },
            {
              "field": "Microsoft.Web/sites/publicNetworkAccess",
              "notEquals": "Disabled"
            }
          ]
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
      "defaultValue": "Audit"
    }
  })
}