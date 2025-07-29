#policy
resource "azurerm_policy_definition" "PCD-DeployDiagnosticsNIC" {
  name         = "PCD-DeployDiagnosticsNIC"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "PCD-DeployDiagnosticsNIC"
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
          "equals": "[parameters('applicableResourceType')]",
          "field": "type"
        },
        {
          "exists": false,
          "field": "[concat('tags[', 'databricks-instance-name' , ']')]"
        }
      ]
    },
    "then": {
      "details": {
        "deployment": {
          "properties": {
            "mode": "incremental",
            "parameters": {
              "id": {
                "value": "[field('id')]"
              },
              "location": {
                "value": "[field('location')]"
              },
              "logAnalyticsWorkspaceId": {
                "value": "[parameters('logAnalyticsWorkspaceId')]"
              },
              "logsToCollect": {
                "value": "[parameters('logsToCollect')]"
              },
              "metricsToCollect": {
                "value": "[parameters('metricsToCollect')]"
              }
            },
            "template": {
              "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
              "contentVersion": "1.0.0",
              "parameters": {
                "id": {
                  "type": "String"
                },
                "location": {
                  "type": "String"
                },
                "logAnalyticsWorkspaceId": {
                  "type": "String"
                },
                "logsToCollect": {
                  "type": "Array"
                },
                "metricsToCollect": {
                  "type": "Array"
                }
              },
              "resources": [
                {
                  "apiVersion": "2021-05-01-preview",
                  "location": "[parameters('location')]",
                  "name": "DefaultDiagnosticsToLAW",
                  "properties": {
                    "logs": "[parameters('logsToCollect')]",
                    "metrics": "[parameters('metricsToCollect')]",
                    "workspaceId": "[parameters('logAnalyticsWorkspaceId')]"
                  },
                  "scope": "[parameters('id')]",
                  "type": "microsoft.insights/diagnosticSettings"
                }
              ]
            }
          }
        },
        "evaluationDelay": "AfterProvisioningSuccess",
        "existenceCondition": {
          "allOf": [
            {
              "equals": "true",
              "field": "microsoft.insights/diagnosticSettings/metrics.enabled"
            },
            {
              "equals": "[parameters('logAnalyticsWorkspaceId')]",
              "field": "microsoft.insights/diagnosticSettings/workspaceId"
            }
          ]
        },
        "roleDefinitionIds": [
          "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
        ],
        "type": "microsoft.insights/diagnosticSettings"
      },
      "effect": "[parameters('effect')]"
    }
  }
POLICY_RULE


  parameters = <<PARAMETERS
 {
    "applicableResourceType": {
      "type": "String",
      "metadata": {
        "displayName": "applicableResourceType",
        "description": "Enable, audit or disable the execution of the policy",
        "strongType": "resourceTypes"
      }
    },
    "effect": {
      "type": "String",
      "metadata": {
        "displayName": "Effect",
        "description": "Enable, audit or disable the execution of the policy"
      },
      "allowedValues": [
        "DeployIfNotExists",
        "Disabled"
      ],
      "defaultValue": "DeployIfNotExists"
    },
    "logAnalyticsWorkspaceId": {
      "type": "String",
      "metadata": {
        "displayName": "logAnalyticsWorkspaceId",
        "description": "The Id of a log analytics workspace ID"
      }
    },
    "logsToCollect": {
      "type": "Array",
      "metadata": {
        "displayName": "logsToCollect",
        "description": "Array of logs to collect from a resource"
      }
    },
    "metricsToCollect": {
      "type": "Array",
      "metadata": {
        "displayName": "metricsToCollect",
        "description": "Array of metrics to collect from a resource"
      }
    }
  }


PARAMETERS

}
