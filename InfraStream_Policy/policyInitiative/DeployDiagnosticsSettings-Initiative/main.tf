resource "azurerm_policy_set_definition" "DeployDiagnosticsSettings-Initiative" {
  name         = "DeployDiagnosticsSettings-Initiative"
  policy_type  = "Custom"
  display_name = "DeployDiagnosticsSettings-Initiative"
  management_group_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg"
  parameters = file("${path.module}/initiative-parameters.json")

  #Enable logging by category group for SignalR (microsoft.signalrservice/signalr) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/93a604fe-0ec2-4a99-ab8c-7ef08f05555a"
    reference_id = "DeployDiagnosticsSignalR"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsSignalR')]"}
    })
  }

  #Enable logging by category group for Network security groups (microsoft.network/networksecuritygroups) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/baa4c6de-b7cf-4b12-b436-6e40ef44c8cb"
    reference_id = "DeployDiagnosticsNSG"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsNSG')]"}
    })
  }
  
  #Enable logging by category group for Front Door and CDN profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e9c56c41-d453-4a80-af93-2331afeb3d82"
    reference_id = "DeployDiagnosticsFrontDoor"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsFrontDoor')]"}
    })
  }
  
  #Enable logging by category group for Automation Account profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/1bd91eae-4429-4f23-b780-8c9622e023e3"
    reference_id = "DeployDiagnosticsAA"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsAA')]"}
    })
  }

  #Enable logging by category group for Front Door and CDN profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/6201aeb7-2b5c-4671-8ab4-5d3ba4d77f3b"
    reference_id = "DeployDiagnosticsFrontDoorCDN"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsFrontDoorCDN')]"}
    })
  }

  #Enable logging by category group for Load Balancer profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/889bfebf-7428-426e-a86f-79e2a7de2f71"
    reference_id = "DeployDiagnosticsLoadBalancer"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsLoadBalancer')]"}
    })
  }

  #Enable logging by category group for EventGrid profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/46b2dd5d-3936-4347-8908-b298ea4466d3"
    reference_id = "DeployDiagnosticsEventGridTopic"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsEventGridTopic')]"}
    })
  }

  #Enable logging by category group for Analysis Service profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e40b8f6f-0ecf-4c3b-b095-ba3562256e48"
    reference_id = "DeployDiagnosticsAnalysisService"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsAnalysisService')]"}
    })
  }

  #Enable logging by category group for Cosmos DB profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/68ba9fc9-71b9-4e6f-9cf5-ecc07722324c"
    reference_id = "DeployDiagnosticsCosmosDB"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsCosmosDB')]"}
    })
  }

  #Enable logging by category group for Data Factory profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/751f9297-5aae-4313-af2d-2a89226a7856"
    reference_id = "DeployDiagnosticsDataFactory"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsDataFactory')]"}
    })
  }

  #Enable logging by category group for MySQL Servers profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/041fdf14-0dd4-4ce0-83ff-de5456be0c85"
    reference_id = "DeployDiagnosticsMySQL"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsMySQL')]"}
    })
  }

  #Enable logging by category group for PostgreSQL with flexibleservers profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/5fbd326d-328c-414e-a922-2d6963998962"
    reference_id = "DeployDiagnosticsPostgreSQLFlexibleservers"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsPostgreSQLFlexibleservers')]"}
    })
  }

  #Enable logging by category group for PostgreSQL server profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/bbdbb83b-cbfe-49f7-b7d1-1126630a68b7"
    reference_id = "DeployDiagnosticsPostgreSQL"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsPostgreSQL')]"}
    })
  }

  #Enable logging by category group for MySQL Flexible server profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/7860f3fe-0db3-42d4-bf3d-7042ea5e5787"
    reference_id = "DeployDiagnosticsMySQLFlexibleservers"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsMySQLFlexibleservers')]"}
    })
  }

  #Enable logging by category group for Databricks profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/454c7d4b-c141-43f1-8c81-975ebb15a9b5"
    reference_id = "DeployDiagnosticsDatabricks"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsDatabricks')]"}
    })
  }

  #Enable logging by category group for APIM profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/567c93f7-3661-494f-a30f-0a94d9bfebf8"
    reference_id = "DeployDiagnosticsAPIMgmt"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsAPIMgmt')]"}
    })
  }

  #Enable logging by category group for Function App (microsoft.web/sites) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e9c22e0d-1f03-44da-a9d5-a9754ea53dc4"
    reference_id = "DeployDiagnosticsWebsiteFunction"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsWebsiteFunction')]"}
    })
  }

  #Enable logging by category group for Data Explorer profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a819f227-229d-44cb-8ad6-25becdb4451f"
    reference_id = "DeployDiagnosticsDataExplorerCluster"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsDataExplorerCluster')]"}
    })
  }
  #Enable logging by category group for synaps,workspaces and kustopools profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/887dc342-c6bd-418b-9407-ab0e27deba36"
    reference_id = "DeployDiagnosticsDataExplorerClusterSynaps"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsDataExplorerClusterSynaps')]"}
    })
  }

  #Enable logging by category group for Firewall profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a4490248-cb97-4504-b7fb-f906afdb7437"
    reference_id = "DeployDiagnosticsFirewall"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsFirewall')]"}
    })
  }

  #Enable logging by category group for Container Registry profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/56288eb2-4350-461d-9ece-2bb242269dce"
    reference_id = "DeployDiagnosticsACR"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsACR')]"}
    })
  }

  #Enable logging by category group for Container App profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/6a664864-e2b5-413e-b930-f11caa132f16"
    reference_id = "DeployDiagnosticsACApp"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsACApp')]"}
    })
  }

  #Enable logging by category group for Event Grid profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/0fff3e39-f422-45b0-b497-33a05b996d3e"
    reference_id = "DeployDiagnosticsEventGridSystemTopic"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsEventGridSystemTopic')]"}
    })
  }

  #Enable logging by category group for Application Gateway profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/92012204-a7e4-4a95-bbe5-90d0d3e12735"
    reference_id = "DeployDiagnosticsApplicationGateway"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsApplicationGateway')]"}
    })
  }

  #Enable logging by category group for Redis Cache profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/aec4c33f-2f2a-4fd3-91cd-24a939513c60"
    reference_id = "DeployDiagnosticsRedisCache"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsRedisCache')]"}
    })
  }

  #Enable logging by category group for NSG profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/baa4c6de-b7cf-4b12-b436-6e40ef44c8cb"
    reference_id = "DeployDiagnosticsNetworkSecurityGroups"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsNetworkSecurityGroups')]"}
    })
  }

  #Enable logging by category group for Cognitive Services profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/55d1f543-d1b0-4811-9663-d6d0dbc6326d"
    reference_id = "DeployDiagnosticsCognitiveServices"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsCognitiveServices')]"}
    })
  }

  #Enable logging by category group for SQL MI profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/8fc4ca5f-6abc-4b30-9565-0bd91ac49420"
    reference_id = "DeployDiagnosticsSQLMI"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsSQLMI')]"}
    })
  }

  #Enable logging by category group for Traffic Manager profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/1118afbc-c48d-43ae-931a-87b38956d40b"
    reference_id = "DeployDiagnosticsTrafficManager"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsTrafficManager')]"}
    })
  }

  #Enable logging by category group for Virtual Network profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/3234ff41-8bec-40a3-b5cb-109c95f1c8ce"
    reference_id = "DeployDiagnosticsVirtualNetwork"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsVirtualNetwork')]"}
    })
  }

  #Enable logging by category group for Managed Grafana profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/d98f63ed-e319-4dc3-898f-600953a05f7e"
    reference_id = "DeployDiagnosticsGrafana"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsGrafana')]"}
    })
  }

  #Enable logging by category group for Event Grid profiles (microsoft.network/frontdoors) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/3496f6fd-57ba-485c-8a14-183c4493b781"
    reference_id = "DeployDiagnosticsEventGridNamespace"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsEventGridNamespace')]"}
    })
  }

  #Enable logging by category group for Notification Hub Namespaces (microsoft.notificationhubs/namespaces) to Log Analytics
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/69e0da8f-ca50-479d-b1a8-33a31426c512"
    reference_id = "DeployDiagnosticsNotificationHubs"
    parameter_values     = jsonencode(
    {
      "logAnalytics": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "resourceLocationList": {"value"= "[parameters('resourceLocationList-CommonParameter')]"}
      "categoryGroup": {"value"= "[parameters('categoryGroup-CommonParameter')]"}
      "diagnosticSettingName": {"value"= "[parameters('diagnosticSettingName-CommonParameter')]"}
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsNotificationHubs')]"}
    })
  }

 #PCD-DeployDiagnosticsWebServerFarm
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-DeployDiagnosticsWebServerFarm"
    reference_id = "DeployDiagnosticsWebServerFarm"
    parameter_values     = jsonencode(
    {
      "logAnalyticsWorkspaceId": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "metricsToCollect": {"value"= "[parameters('metricsToCollect-DeployDiagnosticsWebServerFarm')]"},
      "logsToCollect": {"value"= "[parameters('logsToCollect-DeployDiagnosticsWebServerFarm')]"},
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsWebServerFarm')]"},
      "applicableResourceType": {"value"= "[parameters('applicableResourceType-DeployDiagnosticsWebServerFarm')]"}
    })
  }
   #PCD-DeployDiagnosticsACI
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-DeployDiagnosticsACI"
    reference_id = "DeployDiagnosticsACI"
    parameter_values     = jsonencode(
    {
      "logAnalyticsWorkspaceId": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "metricsToCollect": {"value"= "[parameters('metricsToCollect-DeployDiagnosticsACI')]"},
      "logsToCollect": {"value"= "[parameters('logsToCollect-DeployDiagnosticsACI')]"},
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsACI')]"},
      "applicableResourceType": {"value"= "[parameters('applicableResourceType-DeployDiagnosticsACI')]"}
    })
  }
   #PCD-DeployDiagnosticsEventGridSub
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-DeployDiagnosticsEventGridSub"
    reference_id = "DeployDiagnosticsEventGridSub"
    parameter_values     = jsonencode(
    {
         "logAnalyticsWorkspaceId": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "metricsToCollect": {"value"= "[parameters('metricsToCollect-DeployDiagnosticsEventGridSub')]"},
      "logsToCollect": {"value"= "[parameters('logsToCollect-DeployDiagnosticsEventGridSub')]"},
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsEventGridSub')]"},
      "applicableResourceType": {"value"= "[parameters('applicableResourceType-DeployDiagnosticsEventGridSub')]"}
    })
  }
   #PCD-DeployDiagnosticsNIC
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-DeployDiagnosticsNIC"
    reference_id = "DeployDiagnosticsNIC"
    parameter_values     = jsonencode(
    {
      "logAnalyticsWorkspaceId": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "metricsToCollect": {"value"= "[parameters('metricsToCollect-DeployDiagnosticsNIC')]"},
      "logsToCollect": {"value"= "[parameters('logsToCollect-DeployDiagnosticsNIC')]"},
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsNIC')]"},
      "applicableResourceType": {"value"= "[parameters('applicableResourceType-DeployDiagnosticsNIC')]"}
    })
  }
   #PCD-DeployDiagnosticsVMSS
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-DeployDiagnosticsVMSS"
    reference_id = "DeployDiagnosticsVMSS"
    parameter_values     = jsonencode(
    {
      "logAnalyticsWorkspaceId": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "metricsToCollect": {"value"= "[parameters('metricsToCollect-DeployDiagnosticsVMSS')]"},
      "logsToCollect": {"value"= "[parameters('logsToCollect-DeployDiagnosticsVMSS')]"},
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsVMSS')]"},
      "applicableResourceType": {"value"= "[parameters('applicableResourceType-DeployDiagnosticsVMSS')]"}
    })
  }

  #PCD-DeployDiagnosticsVM
   policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-DeployDiagnosticsVM"
    reference_id = "DeployDiagnosticsVM"
    parameter_values     = jsonencode(
    {
      "logAnalyticsWorkspaceId": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "metricsToCollect": {"value"= "[parameters('metricsToCollect-DeployDiagnosticsVM')]"},
      "logsToCollect": {"value"= "[parameters('logsToCollect-DeployDiagnosticsVM')]"},
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsVM')]"},
      "applicableResourceType": {"value"= "[parameters('applicableResourceType-DeployDiagnosticsVM')]"}
    })
  }
  #PCD-DeployDiagnosticsSA
   policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-DeployDiagnosticsSA"
    reference_id = "DeployDiagnosticsSA"
    parameter_values     = jsonencode(
    {
      "logAnalyticsWorkspaceId": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "metricsToCollect": {"value"= "[parameters('metricsToCollect-DeployDiagnosticsSA')]"},
      "logsToCollect": {"value"= "[parameters('logsToCollect-DeployDiagnosticsSA')]"},
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsSA')]"},
      "applicableResourceType": {"value"= "[parameters('applicableResourceType-DeployDiagnosticsSA')]"}
    })
  }

  #PCD-DeployDiagnosticsSABlob
   policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-DeployDiagnosticsSA"
    reference_id = "DeployDiagnosticsSAsubresourceBlob"
    parameter_values     = jsonencode(
    {
      "logAnalyticsWorkspaceId": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "metricsToCollect": {"value"= "[parameters('metricsToCollect-DeployDiagnosticsSA')]"},
      "logsToCollect": {"value"= "[parameters('logsToCollect-DeployDiagnosticsSAsubresource')]"},
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsSA')]"},
      "applicableResourceType": {"value"= "[parameters('applicableResourceType-DeployDiagnosticsSABlob')]"}
    })
  }

  #PCD-DeployDiagnosticsSAFile
   policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-DeployDiagnosticsSA"
    reference_id = "DeployDiagnosticsSAsubresourceFile"
    parameter_values     = jsonencode(
    {
      "logAnalyticsWorkspaceId": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "metricsToCollect": {"value"= "[parameters('metricsToCollect-DeployDiagnosticsSA')]"},
      "logsToCollect": {"value"= "[parameters('logsToCollect-DeployDiagnosticsSAsubresource')]"},
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsSA')]"},
      "applicableResourceType": {"value"= "[parameters('applicableResourceType-DeployDiagnosticsSAFile')]"}
    })
  }

  #PCD-DeployDiagnosticsSAQueue
   policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-DeployDiagnosticsSA"
    reference_id = "DeployDiagnosticsSAsubresourceQueue"
    parameter_values     = jsonencode(
    {
      "logAnalyticsWorkspaceId": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "metricsToCollect": {"value"= "[parameters('metricsToCollect-DeployDiagnosticsSA')]"},
      "logsToCollect": {"value"= "[parameters('logsToCollect-DeployDiagnosticsSAsubresource')]"},
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsSA')]"},
      "applicableResourceType": {"value"= "[parameters('applicableResourceType-DeployDiagnosticsSAQueue')]"}
    })
  }

  #PCD-DeployDiagnosticsSATable
   policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policyDefinitions/PCD-DeployDiagnosticsSA"
    reference_id = "DeployDiagnosticsSAsubresourceTable"
    parameter_values     = jsonencode(
    {
      "logAnalyticsWorkspaceId": {"value"= "[parameters('logAnalytics-CommonParameter')]"},
      "metricsToCollect": {"value"= "[parameters('metricsToCollect-DeployDiagnosticsSA')]"},
      "logsToCollect": {"value"= "[parameters('logsToCollect-DeployDiagnosticsSAsubresource')]"},
      "effect": {"value"= "[parameters('effect-DeployDiagnosticsSA')]"},
      "applicableResourceType": {"value"= "[parameters('applicableResourceType-DeployDiagnosticsSATable')]"}
    })
  }
}

