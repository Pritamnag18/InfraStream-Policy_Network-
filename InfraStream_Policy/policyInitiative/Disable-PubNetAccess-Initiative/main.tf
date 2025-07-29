resource "azurerm_policy_set_definition" "Disable-PubNetAccess-Initiative" {
  name         = "Disable-PubNetAccess-Initiative"
  policy_type  = "Custom"
  display_name = "Disable-PubNetAccess-Initiative"
  management_group_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg"
  parameters = file("${path.module}/initiative-parameters.json")

  #PCD-AppServiceVnetRouteAllPolicy
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-AppServiceVnetRouteAllPolicy"
    reference_id = "AppServiceVnetRouteAllPolicy"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-AppServiceVnetRouteAllPolicy')]"}
    })
  }

  #App Service app slots should be injected into a virtual network
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/24b7a1c6-44fe-40cc-a2e6-242d2ef70e98"
    reference_id = "DisableVNetPNAAppServiceSlot"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-DisableVNetPNAAppServiceSlot')]"}
    })
  }

  #Storage account public access should be disallowed
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/4fa4b6c0-31ca-4c0d-b10d-24b96f62a751"
    reference_id = "DisableStoragePublicAccess"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-DisableStoragePublicAccess')]"}
    })
  }

  #App Service app slots should disable public network access
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/701a595d-38fb-4a66-ae6d-fb3735217622"
    reference_id = "DisablePNAAppServiceslots"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-DisablePNAAppServiceslots')]"}
    })
  }

  #App Service app slots should enable configuration routing to Azure Virtual Network
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/5747353b-1ca9-42c1-a4dd-b874b894f3d4"
    reference_id = "EnableVNetAAppServiceslots"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-EnableVNetAAppServiceslots')]"}
    })
  }

  #App Service apps should be injected into a virtual network
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/72d04c29-f87d-4575-9731-419ff16a2757"
    reference_id = "InjectVNetAAppService"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-InjectVNetAAppService')]"}
    })
  }

  #App Service apps should enable configuration routing to Azure Virtual Network
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/801543d1-1953-4a90-b8b0-8cf6d41473a5"
    reference_id = "EnableVNetAAppServiceRouting"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-EnableVNetAAppServiceRouting')]"}
    })
  }

  #App Service Environment apps should not be reachable over public internet
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/2d048aca-6479-4923-88f5-e2ac295d9af3"
    reference_id = "ReachablePNAppService"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-ReachablePNAppService')]"}
    })
  }

  #Azure Cosmos DB accounts should have firewall rules
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/862e97cf-49fc-4a5c-9de4-40d4e2e7c8eb"
    reference_id = "EanbleCosmosDBAccountsFW"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-EanbleCosmosDBAccountsFW')]"}
    })
  }

  #Azure Event Grid namespaces should disable public network access
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/67dcad1a-ec60-45df-8fd0-14c9d29eeaa2"
    reference_id = "DisableEGNanespacePublicNetwork"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-DisableEGNanespacePublicNetwork')]"}
    })
  }

  #Azure Key Vault should have firewall enabled
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/55615ac9-af46-4a59-874e-391cc3dfb490"
    reference_id = "EnableAZKeyVaultFW"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-EnableAZKeyVaultFW')]"}
    })
  }

  #Azure Managed Grafana workspaces should disable public network access
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e8775d5a-73b7-4977-a39b-833ef0114628"
    reference_id = "DisableAZMGrafanaPublicNetwork"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-DisableAZMGrafanaPublicNetwork')]"}
    })
  }

  #Container App environments should use network injection
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/8b346db6-85af-419b-8557-92cee2c0f9bb"
    reference_id = "UseVetInjectonContainerApp"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-UseVetInjectonContainerApp')]"}
    })
  }

  #Container Apps environment should disable public network access
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/d074ddf8-01a5-4b5e-a2b8-964aed452c0a"
    reference_id = "DisableContainerAppPublicNetwork"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-DisableContainerAppPublicNetwork')]"}
    })
  }

  #Function app slots should disable public network access
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/11c82d0c-db9f-4d7b-97c5-f3f9aa957da2"
    reference_id = "DisableFunctionAppSlotsPublicNetwork"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-DisableFunctionAppSlotsPublicNetwork')]"}
    })
  }

  #PCD-AppServiceSlotsVnetRouteAllPolicy
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-AppServiceSlotsVnetRouteAllPolicy"
    reference_id = "DisableAppServiceSlotsVnetRouteAllPolicy"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-DisableAppServiceSlotsVnetRouteAllPolicy')]"}
    })
  }

  #PCD-AppServiceVnetRouteAllPolicy
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-AppServiceVnetRouteAllPolicy"
    reference_id = "DisableAppServiceVnetRouteAllPolicy"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-DisableAppServiceVnetRouteAllPolicy')]"}
    })
  }

  #PCD-BlockPublicKeyVaults
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-BlockPublicKeyVaults"
    reference_id = "BlockPublicKeyVaults"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-BlockPublicKeyVaults')]"}
    })
  }

  #PCD-BlockPubNet-PostgresFlex
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-BlockPubNet-PostgresFlex"
    reference_id = "DisablePublicNetPostgresFlex"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-DisablePublicNetPostgresFlex')]"}
    })
  }


  #PCD-BlockStrAcc-PubAccess
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-BlockStrAcc-PubAccess"
    reference_id = "PCDBlockStrAccPA"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-PCDBlockStrAccPAc')]"}
    })
  }

  #PCD-EventHub-Disable-PNA
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-EventHub-Disable-PNA"
    reference_id = "PCDDisablePNAEventHub"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-PCDDisablePNAEventHub')]"}
    })
  }

  
  #PCD-FunctionAppsEnableConfRoutingToVnetPolicy
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-FunctionAppsEnableConfRoutingToVnetPolicy"
    reference_id = "PCDEnableFunctionAppConfRoutingVnetPolicy"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-PCDEnableFunctionAppConfRoutingVnetPolicy')]"}
    })
  }

  #PCD-FunctionAppsSlotsEnableConfRoutingToVnetPolicy
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-FunctionAppsSlotsEnableConfRoutingToVnetPolicy"
    reference_id = "PCDEnableFunctionAppSlotsRoutingVnetPolicy"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-PCDEnableFunctionAppSlotsRoutingVnetPolicy')]"}
    })
  }

  #PCD-FunctionAppsSlotsVnetRouteAllPolicy
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-FunctionAppsSlotsVnetRouteAllPolicy"
    reference_id = "PCDEnableFunctionAppSlotsVnetRouteAllPolicy"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-PCDEnableFunctionAppSlotsVnetRouteAllPolicy')]"}
    })
  }

  #PCD-FunctionAppsVnetRouteAllPolicy
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-FunctionAppsVnetRouteAllPolicy"
    reference_id = "PCDEnableFunctionAppVnetRouteAllPolicy"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-PCDEnableFunctionAppVnetRouteAllPolicy')]"}
    })
  }

  #PCD-PNAI-CosmosDb-Disable-PNA
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-PNAI-CosmosDb-Disable-PNA"
    reference_id = "PCDDisableCosmosDbPNA"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-PCDDisableCosmosDbPNA')]"}
    })
  }

  #PCD-RedisEnterprisePNA
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-RedisEnterprisePNA"
    reference_id = "PCDPrivateEnspointConfigRedisEnterprisePNA"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-PCDPrivateEnspointConfigRedisEnterprisePNA')]"}
    })
  }

  #Public network access on Azure SQL Database should be disabled
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/1b8ca024-1d5c-4dec-8995-b1a932b41780"
    reference_id = "DisableAzureSQLDbPNA"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-DisableAzureSQLDbPNA')]"}
    })
  }

  #Public network access should be disabled for Azure File Sync
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/21a8cd35-125e-4d13-b82d-2e19b7208bb7"
    reference_id = "DisableAzureFileSyncPNA"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-DisableAzureFileSyncPNA')]"}
    })
  }

#Public network access should be disabled for Batch accounts
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/74c5a0ae-5e48-4738-b093-65e23a060488"
    reference_id = "DisableBatchAcoountPNA"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-DisableBatchAcoountPNA')]"}
    })
  }

  #Public network access should be disabled for MySQL flexible servers
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/c9299215-ae47-4f50-9c54-8a392f68a052"
    reference_id = "DisableMSSQLflexibleServersPNA"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-DisableMSSQLflexibleServersPNA')]"}
    })
  }

  #Public network access should be disabled for PostgreSQL flexible servers
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/5e1de0e3-42cb-4ebc-a86d-61d0c619ca48"
    reference_id = "DisablePostgreSQLflexibleServersPNA"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-DisablePostgreSQLflexibleServersPNA')]"}
    })
  }

  #Public network access should be disabled for PostgreSQL servers
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/b52376f7-9612-48a1-81cd-1ffe4b61032c"
    reference_id = "DisablePostgreSQLServersPNA"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-DisablePostgreSQLServersPNA')]"}
    })
  }

  #Storage accounts should restrict network access
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/34c877ad-507e-4c82-993e-3452a6e0ad3c"
    reference_id = "RestrictStrAccountNetworkAccess"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-RestrictStrAccountNetworkAccess')]"}
    })
  }

  #Storage accounts should restrict network access using virtual network rules
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/2a1a9cdf-e04d-429a-8416-3bfb72a1b26f"
    reference_id = "RestrictStrAccountVNetRule"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-RestrictStrAccountVNetRule')]"}
    })
  }

 #PCD-AppServiceAppsPNA
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-AppServiceAppsPNA"
    reference_id = "AppServiceAppsPNA"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-AppServiceAppsPNA')]"}
    })
  }

   #PCD-FunctionAppsPNA
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-FunctionAppsPNA"
    reference_id = "FunctionAppsPNA"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-FunctionAppsPNA')]"}
    })
  }

   #PCD-DenyPublicIPsForDatabricksCluster
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-DenyPublicIPsForDatabricksCluster"
    reference_id = "DenyPublicIPsForDatabricksCluster"
    
    parameter_values     = jsonencode(
    {
      "effect": {"value"= "[parameters('effect-DenyPublicIPsForDatabricksCluster')]"}
    })
  }
}