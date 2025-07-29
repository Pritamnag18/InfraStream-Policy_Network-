

#policy
resource "azurerm_policy_definition" "PCD-Allowed-virtual-machine-size-SKUs" {
  name         = "PCD-Allowed-virtual-machine-size-SKUs"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "PCD-Allowed-virtual-machine-size-SKUs"
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
          "equals": "Microsoft.Compute/virtualMachines",
          "field": "type"
        },
        {
          "field": "Microsoft.Compute/virtualMachines/sku.name",
          "notIn": "[parameters('allowedVMSizeSKUs')]"
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
    "allowedVMSizeSKUs": {
      "type": "Array",
      "metadata": {
        "description": "The list of allowed virtual machine size SKUs.",
        "displayName": "Allowed VM Size SKUs"
      },
      "allowedValues": [
        "Standard_B1s",
        "Standard_B2s",
        "Standard_D2s_v3",
        "Standard_D4s_v3"
      ],
     "defaultValue": [
       "Standard_B1s"
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
        "Disabled",
        "Deny"
      ],
      "defaultValue": "Deny"
    }
  }

PARAMETERS

}

/*
{
  "mode": "All",
  "parameters": {
    "allowedVMSizeSKUs": {
      "type": "Array",
      "metadata": {
        "description": "The list of allowed virtual machine size SKUs.",
        "displayName": "Allowed VM Size SKUs"
      },
      "allowedValues": [
        "Standard_B1s",
        "Standard_B2s",
        "Standard_D2s_v3",
        "Standard_D4s_v3"
      ],
     "defaultValue": [
       "Standard_B1s"
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
        "Disabled",
        "Deny"
      ],
      "defaultValue": "Deny"
    }
  },
  "policyRule": {
    "if": {
      "allOf": [
        {
          "equals": "Microsoft.Compute/virtualMachines",
          "field": "type"
        },
        {
          "field": "Microsoft.Compute/virtualMachines/sku.name",
          "notIn": "[parameters('allowedVMSizeSKUs')]"
        }
      ]
    },
    "then": {
      "effect": "[parameters('effect')]"
    }
  }
}
*/

