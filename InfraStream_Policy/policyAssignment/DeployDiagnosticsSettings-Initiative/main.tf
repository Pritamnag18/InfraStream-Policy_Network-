resource "azurerm_management_group_policy_assignment" "DeployDiagnosticsSettings-Initiative" {
  name                 = "Deploydiag-Initiative" #Has a limit of 24 characters
  display_name         = "DeployDiagnosticsSettings-Initiative"
  policy_definition_id = "/providers/Microsoft.Management/managementGroups/infras-root-mg/providers/Microsoft.Authorization/policySetDefinitions/DeployDiagnosticsSettings-Initiative"
  #subscription_id      = "/subscriptions/f7b33f6a-5cf5-4826-9c31-2089d4779206"
  management_group_id      = var.management_group_id
  
  location = "eastus"
  identity {
    type="SystemAssigned"
    
  }
  parameters = jsonencode(
    {
      "logAnalytics-CommonParameter": {"value": "${var.logAnalytics-CommonParameter}"}
      "diagnosticSettingName-CommonParameter": {"value": "${var.diagnosticSettingName-CommonParameter}"}
      "categoryGroup-CommonParameter": {"value": "${var.categoryGroup-CommonParameter}"}
      "resourceLocationList-CommonParameter": {"value": "${var.resourceLocationList-CommonParameter}"}
      "applicableResourceType-DeployDiagnosticsACI": {"value": "${var.applicableResourceType-DeployDiagnosticsACI}"}
      "applicableResourceType-DeployDiagnosticsEventGridSub": {"value": "${var.applicableResourceType-DeployDiagnosticsEventGridSub}"}
      "applicableResourceType-DeployDiagnosticsNIC": {"value": "${var.applicableResourceType-DeployDiagnosticsNIC}"}
      "applicableResourceType-DeployDiagnosticsSA": {"value": "${var.applicableResourceType-DeployDiagnosticsSA}"}
      "applicableResourceType-DeployDiagnosticsSABlob": {"value": "${var.applicableResourceType-DeployDiagnosticsSABlob}"}
      "applicableResourceType-DeployDiagnosticsSAFile": {"value": "${var.applicableResourceType-DeployDiagnosticsSAFile}"}
      "applicableResourceType-DeployDiagnosticsSAQueue": {"value": "${var.applicableResourceType-DeployDiagnosticsSAQueue}"}
      "applicableResourceType-DeployDiagnosticsSATable": {"value": "${var.applicableResourceType-DeployDiagnosticsSATable}"}
      "applicableResourceType-DeployDiagnosticsVM": {"value": "${var.applicableResourceType-DeployDiagnosticsVM}"}
      "applicableResourceType-DeployDiagnosticsVMSS": {"value": "${var.applicableResourceType-DeployDiagnosticsVMSS}"}
      "applicableResourceType-DeployDiagnosticsWebServerFarm": {"value": "${var.applicableResourceType-DeployDiagnosticsWebServerFarm}"}
      "logsToCollect-DeployDiagnosticsACI": {"value": "${var.logsToCollect-DeployDiagnosticsACI}"}
      "logsToCollect-DeployDiagnosticsEventGridSub": {"value": "${var.logsToCollect-DeployDiagnosticsEventGridSub}"}
      "logsToCollect-DeployDiagnosticsNIC": {"value": "${var.logsToCollect-DeployDiagnosticsNIC}"}
      "logsToCollect-DeployDiagnosticsSA": {"value": "${var.logsToCollect-DeployDiagnosticsSA}"}
      "logsToCollect-DeployDiagnosticsSAsubresource": {"value": "${var.logsToCollect-DeployDiagnosticsSAsubresource}"}
      "logsToCollect-DeployDiagnosticsVM": {"value": "${var.logsToCollect-DeployDiagnosticsVM}"}
      "logsToCollect-DeployDiagnosticsVMSS": {"value": "${var.logsToCollect-DeployDiagnosticsVMSS}"}
      "logsToCollect-DeployDiagnosticsWebServerFarm": {"value": "${var.logsToCollect-DeployDiagnosticsWebServerFarm}"}
      "metricsToCollect-DeployDiagnosticsACI": {"value": "${var.metricsToCollect-DeployDiagnosticsACI}"}
      "metricsToCollect-DeployDiagnosticsEventGridSub": {"value": "${var.metricsToCollect-DeployDiagnosticsEventGridSub}"}
      "metricsToCollect-DeployDiagnosticsNIC": {"value": "${var.metricsToCollect-DeployDiagnosticsNIC}"}
      "metricsToCollect-DeployDiagnosticsSA": {"value": "${var.metricsToCollect-DeployDiagnosticsSA}"}
      "metricsToCollect-DeployDiagnosticsVM": {"value": "${var.metricsToCollect-DeployDiagnosticsVM}"}
      "metricsToCollect-DeployDiagnosticsVMSS": {"value": "${var.metricsToCollect-DeployDiagnosticsVMSS}"}
      "metricsToCollect-DeployDiagnosticsWebServerFarm": {"value": "${var.metricsToCollect-DeployDiagnosticsWebServerFarm}"}
      "effect-DeployDiagnosticsAA": {"value": "${var.effect-DeployDiagnosticsAA}"}
      "effect-DeployDiagnosticsACApp": {"value": "${var.effect-DeployDiagnosticsACApp}"}
      "effect-DeployDiagnosticsACI": {"value": "${var.effect-DeployDiagnosticsACI}"}
      "effect-DeployDiagnosticsACR": {"value": "${var.effect-DeployDiagnosticsACR}"}
      "effect-DeployDiagnosticsAnalysisService": {"value": "${var.effect-DeployDiagnosticsAnalysisService}"}
      "effect-DeployDiagnosticsAPIMgmt": {"value": "${var.effect-DeployDiagnosticsAPIMgmt}"}
      "effect-DeployDiagnosticsApplicationGateway": {"value": "${var.effect-DeployDiagnosticsApplicationGateway}"}
      "effect-DeployDiagnosticsCognitiveServices": {"value": "${var.effect-DeployDiagnosticsCognitiveServices}"}
      "effect-DeployDiagnosticsCosmosDB": {"value": "${var.effect-DeployDiagnosticsCosmosDB}"}
      "effect-DeployDiagnosticsDatabricks": {"value": "${var.effect-DeployDiagnosticsDatabricks}"}
      "effect-DeployDiagnosticsDataExplorerCluster": {"value": "${var.effect-DeployDiagnosticsDataExplorerCluster}"}
      "effect-DeployDiagnosticsDataExplorerClusterSynaps": {"value": "${var.effect-DeployDiagnosticsDataExplorerClusterSynaps}"}
      "effect-DeployDiagnosticsDataFactory": {"value": "${var.effect-DeployDiagnosticsDataFactory}"}
      "effect-DeployDiagnosticsEventGridNamespace": {"value": "${var.effect-DeployDiagnosticsEventGridNamespace}"}
      "effect-DeployDiagnosticsEventGridSub": {"value": "${var.effect-DeployDiagnosticsEventGridSub}"}
      "effect-DeployDiagnosticsEventGridSystemTopic": {"value": "${var.effect-DeployDiagnosticsEventGridSystemTopic}"}
      "effect-DeployDiagnosticsEventGridTopic": {"value": "${var.effect-DeployDiagnosticsEventGridTopic}"}
      "effect-DeployDiagnosticsFirewall": {"value": "${var.effect-DeployDiagnosticsFirewall}"}
      "effect-DeployDiagnosticsFrontDoor": {"value": "${var.effect-DeployDiagnosticsFrontDoor}"}
      "effect-DeployDiagnosticsFrontDoorCDN": {"value": "${var.effect-DeployDiagnosticsFrontDoorCDN}"}
      "effect-DeployDiagnosticsGrafana": {"value": "${var.effect-DeployDiagnosticsGrafana}"}
      "effect-DeployDiagnosticsLoadBalancer": {"value": "${var.effect-DeployDiagnosticsLoadBalancer}"}
      "effect-DeployDiagnosticsMySQL": {"value": "${var.effect-DeployDiagnosticsMySQL}"}
      "effect-DeployDiagnosticsMySQLFlexibleservers": {"value": "${var.effect-DeployDiagnosticsMySQLFlexibleservers}"}
      "effect-DeployDiagnosticsNetworkSecurityGroups": {"value": "${var.effect-DeployDiagnosticsNetworkSecurityGroups}"}
      "effect-DeployDiagnosticsNIC": {"value": "${var.effect-DeployDiagnosticsNIC}"}
      "effect-DeployDiagnosticsNotificationHubs": {"value": "${var.effect-DeployDiagnosticsNotificationHubs}"}
      "effect-DeployDiagnosticsNSG": {"value": "${var.effect-DeployDiagnosticsNSG}"}
      "effect-DeployDiagnosticsPostgreSQL": {"value": "${var.effect-DeployDiagnosticsPostgreSQL}"}
      "effect-DeployDiagnosticsPostgreSQLFlexibleservers": {"value": "${var.effect-DeployDiagnosticsPostgreSQLFlexibleservers}"}
      "effect-DeployDiagnosticsRedisCache": {"value": "${var.effect-DeployDiagnosticsRedisCache}"}
      "effect-DeployDiagnosticsSA": {"value": "${var.effect-DeployDiagnosticsSA}"}
      "effect-DeployDiagnosticsSignalR": {"value": "${var.effect-DeployDiagnosticsSignalR}"}
      "effect-DeployDiagnosticsSQLMI": {"value": "${var.effect-DeployDiagnosticsSQLMI}"}
      "effect-DeployDiagnosticsTrafficManager": {"value": "${var.effect-DeployDiagnosticsTrafficManager}"}
      "effect-DeployDiagnosticsVirtualNetwork": {"value": "${var.effect-DeployDiagnosticsVirtualNetwork}"}
      "effect-DeployDiagnosticsVM": {"value": "${var.effect-DeployDiagnosticsVM}"}
      "effect-DeployDiagnosticsVMSS": {"value": "${var.effect-DeployDiagnosticsVMSS}"}
      "effect-DeployDiagnosticsWebServerFarm": {"value": "${var.effect-DeployDiagnosticsWebServerFarm}"}
      "effect-DeployDiagnosticsWebsiteFunction": {"value": "${var.effect-DeployDiagnosticsWebsiteFunction}"}

    }
    )
}


