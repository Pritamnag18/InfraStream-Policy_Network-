#policy
resource "azurerm_policy_definition" "PCD-BlockList-ResourceTypes" {
  name         = "PCD-BlockList-ResourceTypes"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "PCD-BlockList-ResourceTypes"
  management_group_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg"

#   metadata = <<METADATA
#     {
#     "category": "General"
#     }

# METADATA


  policy_rule = <<POLICY_RULE
  {
    "if": {
      "allOf": [
        {
          "exists": true,
          "field": "type"
        },
        {
          "anyOf": [
            {
              "field": "type",
              "in": "[parameters('blockListResourceTypes')]"
            },
            {
              "in": "[parameters('blockListResourceTypes')]",
              "value": "[concat(split(field('type'),'/')[0],'/',split(field('type'),'/')[1])]"
            }
          ]
        }
      ]
    },
    "then": {
      "effect": "[parameters('effect')]"
    }
  }
 POLICY_RULE


  parameters = <<PARAMETERS
 {
    "blockListResourceTypes": {
      "type": "Array",
      "metadata": {
        "displayName": "blockListResourceTypes",
        "description": "Organization - BlockList - Resource Types"
      },
      "defaultValue": [
        ""
      ]
    },
    "effect": {
      "type": "String",
      "metadata": {
        "displayName": "Effect",
        "description": "Enable or disable the execution of the policy"
      },
      "allowedValues": [
        "Audit",
        "Deny",
        "Disabled"
      ],
      "defaultValue": "Audit"
    }
  }

PARAMETERS

}
