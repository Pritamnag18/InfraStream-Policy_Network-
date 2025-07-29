resource "azurerm_policy_definition" "PCD-AllowList-RHELServerSKUs" {
  name         = "PCD-AllowList-RHELServerSKUs"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "PCD-AllowList-RHELServerSKUs"
  management_group_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg"
  description  = "This policy checks whether deployed RHEL image SKU versions are 7.4 to 7.9 and 8.3 to 8.7"
  policy_rule = jsonencode({
    "if": {
      "allOf": [
        {
          "field": "type",
          "in": [
            "Microsoft.Compute/virtualMachines",
            "Microsoft.Compute/VirtualMachineScaleSets"
          ]
        },
        {
          "equals": "RedHat",
          "field": "Microsoft.Compute/imagePublisher"
        },
        {
          "equals": "RHEL",
          "field": "Microsoft.Compute/imageOffer"
        },
        {
          "not": {
            "anyOf": [
              {
                "equals": "7_4",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "equals": "7_6",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "equals": "7_7",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "equals": "7_9",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "equals": "8_3",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "equals": "8_4",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "equals": "8_5",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "equals": "8_6*",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "equals": "8_7",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "equals": "7.4",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "equals": "7.5",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "equals": "7.6",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "equals": "7.7",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "equals": "7.8",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "equals": "7.8",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                "like": "74*"
              },
              {
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                "like": "75*"
              },
              {
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                "like": "76-*"
              },
              {
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                "like": "77*"
              },
              {
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                "like": "78*"
              },
              {
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                "like": "79*"
              },
              {
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                "like": "83*"
              },
              {
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                "like": "84*"
              },
              {
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                "like": "85*"
              },
              {
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                "like": "86*"
              },
              {
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                "like": "87*"
              },
              {
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                "like": "rhel-79"
              },
              {
                "equals": "rhel-lvm74",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "equals": "rhel-lvm75",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "equals": "rhel-lvm76",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "equals": "rhel-lvm77",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "equals": "rhel-lvm78",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "equals": "rhel-lvm79",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "equals": "rhel-lvm83",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "equals": "rhel-lvm84",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "equals": "rhel-lvm85",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "equals": "rhel-lvm86",
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku"
              },
              {
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                "like": "rhel-lvm76*"
              },
              {
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                "like": "rhel-lvm77*"
              },
              {
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                "like": "rhel-lvm78*"
              },
              {
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                "like": "rhel-lvm79*"
              },
              {
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                "like": "rhel-lvm83*"
              },
              {
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                "like": "rhel-lvm84*"
              },
              {
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                "like": "rhel-lvm85*"
              },
              {
                "field": "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                "like": "rhel-lvm86*"
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
    effect = {
      type = "String",
      metadata = {
        displayName = "Effect",
        description = "Enable or disable the execution of the policy"
      },
      allowedValues = [ "Audit", "Deny", "Disabled" ],
      "defaultValue": "Deny"
    }
  })
}