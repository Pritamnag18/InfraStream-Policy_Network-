resource "azurerm_policy_definition" "PCD-AddExtensions-Vm-Linx-AMA" {
  name         = "PCD-AddExtensions-Vm-Linx-AMA"
  policy_type  = "Custom"
  mode         = "All"
management_group_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg"
  display_name = "PCD-AddExtensions-Vm-Linx-AMA"
  
  policy_rule = <<POLICY_RULE
 {
    "if": {
      "allOf": [
        {
          "equals": "Microsoft.Compute/virtualMachines",
          "field": "type"
        },
        {
          "exists": "true",
          "field": "Microsoft.Compute/virtualMachines/osProfile.linuxConfiguration"
        },
        {
          "anyOf": [
            {
              "field": "Microsoft.Compute/imagePublisher",
              "in": [
                "RedHat",
                "Canonical"
              ]
            },
            {
              "contains": "galleries",
              "field": "Microsoft.Compute/imageId"
            }
          ]
        }
      ]
    },
    "then": {
      "details": {
        "deployment": {
          "properties": {
            "mode": "incremental",
            "parameters": {
              "amaVersion": {
                "value": "[parameters('amaVersion')]"
              },
              "dcrResourceId": {
                "value": "[parameters('dcrResourceId')]"
              },
              "location": {
                "value": "[field('location')]"
              },
              "resourceId": {
                "value": "[field('id')]"
              },
              "userAssignedManagedIdentity": {
                "value": "[parameters('userAssignedIdentityId')]"
              },
              "vmName": {
                "value": "[field('name')]"
              }
            },
            "template": {
              "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
              "contentVersion": "1.0.0.0",
              "parameters": {
                "amaVersion": {
                  "type": "string"
                },
                "dcrResourceId": {
                  "type": "string"
                },
                "location": {
                  "type": "string"
                },
                "resourceId": {
                  "type": "string"
                },
                "userAssignedManagedIdentity": {
                  "type": "string"
                },
                "vmName": {
                  "type": "string"
                }
              },
              "resources": [
                {
                  "apiVersion": "2020-06-01",
                  "name": "[variables('deployGetResourceProperties')]",
                  "properties": {
                    "mode": "Incremental",
                    "template": {
                      "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
                      "contentVersion": "1.0.0.0",
                      "outputs": {
                        "resource": {
                          "type": "object",
                          "value": "[reference(parameters('resourceId'), '2019-07-01', 'Full')]"
                        }
                      },
                      "resources": []
                    }
                  },
                  "type": "Microsoft.Resources/deployments"
                },
                {
                  "apiVersion": "2020-06-01",
                  "dependsOn": [
                    "[variables('deployGetResourceProperties')]"
                  ],
                  "name": "[concat(variables('deployAssignUAName'))]",
                  "properties": {
                    "expressionEvaluationOptions": {
                      "scope": "inner"
                    },
                    "mode": "Incremental",
                    "parameters": {
                      "identityType": {
                        "value": "[if(contains(reference(variables('deployGetResourceProperties')).outputs.resource.value, 'identity'), reference(variables('deployGetResourceProperties')).outputs.resource.value.identity.type, '')]"
                      },
                      "location": {
                        "value": "[parameters('location')]"
                      },
                      "uaId": {
                        "value": "[parameters('userAssignedManagedIdentity')]"
                      },
                      "userAssignedIdentities": {
                        "value": "[if(and(contains(reference(variables('deployGetResourceProperties')).outputs.resource.value, 'identity'), contains(reference(variables('deployGetResourceProperties')).outputs.resource.value.identity, 'userAssignedIdentities')), reference(variables('deployGetResourceProperties')).outputs.resource.value.identity.userAssignedIdentities, createObject())]"
                      },
                      "vmName": {
                        "value": "[parameters('vmName')]"
                      }
                    },
                    "template": {
                      "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
                      "contentVersion": "1.0.0.0",
                      "parameters": {
                        "identityType": {
                          "type": "string"
                        },
                        "location": {
                          "type": "string"
                        },
                        "uaId": {
                          "type": "string"
                        },
                        "userAssignedIdentities": {
                          "type": "object"
                        },
                        "vmName": {
                          "type": "string"
                        }
                      },
                      "resources": [
                        {
                          "apiVersion": "2019-07-01",
                          "identity": {
                            "type": "[variables('identityTypeValue')]",
                            "userAssignedIdentities": "[variables('userAssignedIdentitiesValue')]"
                          },
                          "location": "[parameters('location')]",
                          "name": "[parameters('vmName')]",
                          "type": "Microsoft.Compute/virtualMachines"
                        }
                      ],
                      "variables": {
                        "identityTypeValue": "[if(contains(parameters('identityType'), 'SystemAssigned'), 'SystemAssigned,UserAssigned', 'UserAssigned')]",
                        "userAssignedIdentitiesValue": "[union(parameters('userAssignedIdentities'), createObject(parameters('uaId'), createObject()))]"
                      }
                    }
                  },
                  "type": "Microsoft.Resources/deployments"
                },
                {
                  "apiVersion": "2019-07-01",
                  "dependsOn": [
                    "[variables('deployAssignUAName')]"
                  ],
                  "location": "[parameters('location')]",
                  "name": "[variables('amaName')]",
                  "properties": {
                    "autoUpgradeMinorVersion": true,
                    "enableAutomaticUpgrade": true,
                    "publisher": "[variables('amaPublisher')]",
                    "settings": {
                      "authentication": {
                        "managedIdentity": {
                          "identifier-name": "mi_res_id",
                          "identifier-value": "[parameters('userAssignedManagedIdentity')]"
                        }
                      }
                    },
                    "type": "[variables('amaType')]",
                    "typeHandlerVersion": "[parameters('amaVersion')]"
                  },
                  "type": "Microsoft.Compute/virtualMachines/extensions"
                },
                {
                  "apiVersion": "2021-04-01",
                  "dependsOn": [
                    "[resourceId('Microsoft.Compute/virtualMachines/extensions', parameters('vmName'), 'ama')]"
                  ],
                  "name": "[variables('associationName')]",
                  "properties": {
                    "dataCollectionRuleId": "[parameters('dcrResourceId')]"
                  },
                  "scope": "[concat('Microsoft.Compute/virtualMachines/', parameters('vmName'))]",
                  "type": "microsoft.insights/dataCollectionRuleAssociations"
                }
              ],
              "variables": {
                "amaName": "[concat(parameters('vmName'), '/', 'ama')]",
                "amaPublisher": "Microsoft.Azure.Monitor",
                "amaType": "AzureMonitorLinuxAgent",
                "associationName": "[concat('assoc-', uniqueString('dcrtestname1223'))]",
                "deployAssignUAName": "[concat('deployAssignUA-', uniqueString(deployment().name))]",
                "deployGetResourceProperties": "[concat('deployGetResourceProperties-', uniqueString(deployment().name))]"
              }
            }
          }
        },
        "evaluationDelay": "AfterProvisioningSuccess",
        "existenceCondition": {
          "allOf": [
            {
              "equals": "AzureMonitorLinuxAgent",
              "field": "Microsoft.Compute/virtualMachines/extensions/type"
            },
            {
              "equals": "Microsoft.Azure.Monitor",
              "field": "Microsoft.Compute/virtualMachines/extensions/publisher"
            },
            {
              "equals": "Succeeded",
              "field": "Microsoft.Compute/virtualMachines/extensions/provisioningState"
            }
          ]
        },
        "roleDefinitionIds": [
          "/providers/microsoft.authorization/roleDefinitions/f1a07417-d97a-45cb-824c-7a7467783830",
          "/providers/microsoft.authorization/roleDefinitions/749f88d5-cbae-40b8-bcfc-e573ddc772fa",
          "/providers/microsoft.authorization/roleDefinitions/9980e02c-c2be-4d73-94e8-173b1dc7cf3c"
        ],
        "type": "Microsoft.Compute/virtualMachines/extensions"
      },
      "effect": "[parameters('effect')]"
    }
  }
 
POLICY_RULE


  parameters = <<PARAMETERS
{
    "amaVersion": {
      "type": "String",
      "metadata": {
        "displayName": "amaVersion",
        "description": "Version of Azure Monitor Agent"
      },
      "defaultValue": ""
    },
    "dcrResourceId": {
      "type": "String",
      "metadata": {
        "displayName": "Data Collection Rule Resource Id or Data Collection Endpoint Resource Id",
        "description": "Resource Id of the Data Collection Rule or the Data Collection Endpoint to be applied on the Linux machines in scope."
      }
    },
    "effect": {
      "type": "String",
      "metadata": {
        "displayName": "Effect",
        "description": "Enable or disable the execution of the policy"
      },
      "allowedValues": [
        "DeployIfNotExists",
        "Disabled"
      ],
      "defaultValue": "DeployIfNotExists"
    },
    "userAssignedIdentityId": {
      "type": "String",
      "metadata": {
        "displayName": "User-Assigned Managed Identity resourceId",
        "description": "The Id of the user-assigned managed identity which Azure Monitor Agent will use for authentication"
      },
      "defaultValue": ""
    }
  }

PARAMETERS

}
