resource "azurerm_policy_definition" "PCD-AllowList-UbuntuServerSKUs" {
  name         = "PCD-AllowList-UbuntuServerSKUs"
  policy_type  = "Custom"
  mode         = "All"
management_group_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg"
  display_name = "PCD-AllowList-UbuntuServerSKUs"
  description  = "This policy checks whether deployed Ubuntu image SKU versions are higher than 18.04."

  policy_rule = jsonencode({
    if = {
      allOf = [
        {
          field = "type",
          in = [
            "Microsoft.Compute/virtualMachines",
            "Microsoft.Compute/VirtualMachineScaleSets"
          ]
        },
        {
          field = "Microsoft.Compute/imagePublisher",
          equals = "Canonical"
        },
        {
          not = {
            allOf = [
              {
                anyOf = [
                  {
                    field = "Microsoft.Compute/imageOffer",
                    equals = "UbuntuServer"
                  },
                  {
                    field = "Microsoft.Compute/virtualMachines/storageProfile.imageReference.offer",
                    like = "0001-com-ubuntu-*"
                  }
                ]
              },
              {
                anyOf = [
                  {
                    field = "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                    equals = "18.04-LTS"
                  },
                  {
                    field = "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                    like = "18_04-lts-*"
                  },
                  {
                    field = "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                    like = "pro-18_04-lts-*"
                  },
                  {
                    field = "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                    like = "minimal-18_04-lts-*"
                  },
                  {
                    field = "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                    like = "20_04-lts-*"
                  },
                  {
                    field = "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                    like = "minimal-20_04-lts-*"
                  },
                  {
                    field = "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                    like = "pro-20_04-lts-*"
                  },
                  {
                    field = "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                    like = "pro-cis-minimal-20_04-*"
                  },
                  {
                    field = "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                    like = "pro-fips-20_04-*"
                  },
                  {
                    field = "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                    like = "22_04-lts-*"
                  },
                  {
                    field = "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                    like = "pro-22_04-lts-*"
                  },
                  {
                    field = "Microsoft.Compute/virtualMachines/storageProfile.imageReference.sku",
                    like = "minimal-22_04-lts-*"
                  }
                ]
              }
            ]
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
        description = "Enable or disable the execution of the policy"
      }
      allowedValues = ["Audit", "Deny", "Disabled"]
      defaultValue  = "Deny"
    }
  })

  metadata = jsonencode({
    version   = "1.0.0"
    category  = "Compute"
  })
}