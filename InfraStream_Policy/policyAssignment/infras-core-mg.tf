
module "Disable-PubNetAccess-Initiative-core" {
  management_group_id = "/providers/Microsoft.Management/managementGroups/infras-core-mg"
  source = "./Disable-PubNetAccess-Initiative"
  effect-AppServiceVnetRouteAllPolicy = "Deny"
  effect-DisablePNAAppServiceSlots = "Deny"
  effect-DisableFunctionAppSlotsPublicNetwork = "Deny"
  effect-PCDBlockStrAccPAc = "Deny"
  effect-DisableVNetPNAAppServiceSlot = "Audit"
  effect-DisableStoragePublicAccess = "Deny"
  effect-EnableVNetAAppServiceslots = "Audit"
  effect-InjectVNetAAppService = "Audit"
  effect-EnableVNetAAppServiceRouting = "Audit"
  effect-ReachablePNAppService = "Deny"
  effect-EanbleCosmosDBAccountsFW = "Deny"
  effect-DisableEGNanespacePublicNetwork = "Deny"
  effect-EnableAZKeyVaultFW = "Audit"
  effect-DisableAZMGrafanaPublicNetwork = "Deny"
  effect-UseVetInjectonContainerApp = "Audit"
  effect-DisableContainerAppPublicNetwork = "Deny"
  effect-DisableAppServiceSlotsVnetRouteAllPolicy = "Audit"
  effect-DisableAppServiceVnetRouteAllPolicy = "Audit"
  effect-BlockPublicKeyVaults = "Deny"
  effect-DisablePublicNetPostgresFlex = "Deny"
  effect-PCDDisablePNAEventHub = "Deny"
  effect-PCDEnableFunctionAppConfRoutingVnetPolicy = "Audit"
  effect-PCDEnableFunctionAppSlotsRoutingVnetPolicy = "Audit"
  effect-PCDEnableFunctionAppSlotsVnetRouteAllPolicy = "Audit"
  effect-PCDEnableFunctionAppVnetRouteAllPolicy = "Audit"
  effect-PCDDisableCosmosDbPNA = "Append"
  effect-PCDPrivateEnspointConfigRedisEnterprisePNA = "Audit"
  effect-DisableAzureSQLDbPNA = "Deny"
  effect-DisableAzureFileSyncPNA = "Deny"
  effect-DisableBatchAcoountPNA = "Deny"
  effect-DisableMSSQLflexibleServersPNA = "Deny"
  effect-DisablePostgreSQLflexibleServersPNA = "Deny"
  effect-DisablePostgreSQLServersPNA = "Deny"
  effect-RestrictStrAccountNetworkAccess = "Deny"
  effect-RestrictStrAccountVNetRule = "Deny"
  effect-AppServiceAppsPNA = "Deny"
  effect-FunctionAppsPNA = "Deny"
  effect-DenyPublicIPsForDatabricksCluster = "Deny"

}

module "ApprovedVMExtensions-Initiative-core" {
  management_group_id = "/providers/Microsoft.Management/managementGroups/infras-core-mg"
  source = "./ApprovedVMExtensions-Initiative"
  amaVersion-CommonParameter = "1.17"
  dcrResourceId-CommonParameter = "/subscriptions/f7b33f6a-5cf5-4826-9c31-2089d4779206/resourceGroups/prd-inf-eus-rg/providers/Microsoft.Insights/dataCollectionRules/prd-inf-eus-dcr-01"
  effect-CommonParameter = "DeployIfNotExists"
  userAssignedIdentityId-CommonParameter = "/subscriptions/f7b33f6a-5cf5-4826-9c31-2089d4779206/resourceGroups/prd-inf-eus-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/prd-inf-eus-dcr-01-id"
  amaVersion-AddExtensions-Vm-Windows-AMA = "1.17"
  dcrResourceId-AddExtensions-Vm-Windows-AMA = "/subscriptions/f7b33f6a-5cf5-4826-9c31-2089d4779206/resourceGroups/prd-inf-eus-rg/providers/Microsoft.Insights/dataCollectionRules/prd-inf-eus-dcr-01"
  effect-AddExtensions-Vm-Windows-AMA = "DeployIfNotExists"
  userAssignedIdentityId-AddExtensions-Vm-Windows-AMA = "/subscriptions/f7b33f6a-5cf5-4826-9c31-2089d4779206/resourceGroups/prd-inf-eus-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/prd-inf-eus-dcr-01-id"
}

module "DeployDiagnosticsSettings-Initiative-core" {
  management_group_id = "/providers/Microsoft.Management/managementGroups/infras-core-mg"
  source = "./DeployDiagnosticsSettings-Initiative"
  logAnalytics-CommonParameter = "/subscriptions/f7b33f6a-5cf5-4826-9c31-2089d4779206/resourcegroups/prd-inf-eus-rg/providers/microsoft.operationalinsights/workspaces/prd-inf-eus-log-01"
  diagnosticSettingName-CommonParameter = "DeployedByPolicy-LogAnalytics"
  categoryGroup-CommonParameter = "allLogs"
  resourceLocationList-CommonParameter = ["*"]
  applicableResourceType-DeployDiagnosticsACI = "Microsoft.ContainerInstance/containerGroups"
  applicableResourceType-DeployDiagnosticsEventGridSub = "Microsoft.EventGrid/namespaces"
  applicableResourceType-DeployDiagnosticsNIC = "Microsoft.Network/networkInterfaces"
  applicableResourceType-DeployDiagnosticsSA = "Microsoft.Storage/storageAccounts"
  applicableResourceType-DeployDiagnosticsSABlob = "Microsoft.Storage/storageaccounts/blobservices"
  applicableResourceType-DeployDiagnosticsSAFile = "Microsoft.Storage/storageAccounts/fileservices"
  applicableResourceType-DeployDiagnosticsSAQueue = "Microsoft.Storage/storageAccounts/queueservices"
  applicableResourceType-DeployDiagnosticsSATable = "Microsoft.Storage/storageAccounts/tableservices"
  applicableResourceType-DeployDiagnosticsVM = "Microsoft.Compute/virtualMachines"
  applicableResourceType-DeployDiagnosticsVMSS = "Microsoft.Compute/virtualMachineScaleSets"
  applicableResourceType-DeployDiagnosticsWebServerFarm = "Microsoft.Web/serverfarms"
  logsToCollect-DeployDiagnosticsACI = ["AllLogs"]
  logsToCollect-DeployDiagnosticsEventGridSub = ["AllLogs"]
  logsToCollect-DeployDiagnosticsNIC = []
  logsToCollect-DeployDiagnosticsSA = []
  logsToCollect-DeployDiagnosticsSAsubresource = [{"categoryGroup": "allLogs", "enabled": true}]
  logsToCollect-DeployDiagnosticsVM = ["AllLogs"]
  logsToCollect-DeployDiagnosticsVMSS = ["AllLogs"]
  logsToCollect-DeployDiagnosticsWebServerFarm = ["AllLogs"]
  metricsToCollect-DeployDiagnosticsACI = ["AllMetrics"]
  metricsToCollect-DeployDiagnosticsEventGridSub = ["AllMetrics"]
  metricsToCollect-DeployDiagnosticsNIC = [{"category": "AllMetrics", "enabled": true, "retentionPolicy": {"days": 0,"enabled": false },"timeGrain": null}]
  metricsToCollect-DeployDiagnosticsSA = [{"category": "AllMetrics", "enabled": true, "retentionPolicy": {"days": 0,"enabled": false },"timeGrain": null}]
  metricsToCollect-DeployDiagnosticsVM = ["AllMetrics"]
  metricsToCollect-DeployDiagnosticsVMSS = ["AllMetrics"]
  metricsToCollect-DeployDiagnosticsWebServerFarm = ["AllMetrics"]
  effect-DeployDiagnosticsAA = "DeployIfNotExists"
  effect-DeployDiagnosticsACApp = "DeployIfNotExists"
  effect-DeployDiagnosticsACI = "DeployIfNotExists"
  effect-DeployDiagnosticsACR = "DeployIfNotExists"
  effect-DeployDiagnosticsAnalysisService = "DeployIfNotExists"
  effect-DeployDiagnosticsAPIMgmt = "DeployIfNotExists"
  effect-DeployDiagnosticsApplicationGateway = "DeployIfNotExists"
  effect-DeployDiagnosticsCognitiveServices = "DeployIfNotExists"
  effect-DeployDiagnosticsCosmosDB = "DeployIfNotExists"
  effect-DeployDiagnosticsDatabricks = "DeployIfNotExists"
  effect-DeployDiagnosticsDataExplorerCluster = "DeployIfNotExists"
  effect-DeployDiagnosticsDataExplorerClusterSynaps = "DeployIfNotExists"
  effect-DeployDiagnosticsDataFactory = "DeployIfNotExists"
  effect-DeployDiagnosticsEventGridNamespace = "DeployIfNotExists"
  effect-DeployDiagnosticsEventGridSub = "DeployIfNotExists"
  effect-DeployDiagnosticsEventGridSystemTopic = "DeployIfNotExists"
  effect-DeployDiagnosticsEventGridTopic = "DeployIfNotExists"
  effect-DeployDiagnosticsFirewall = "DeployIfNotExists"
  effect-DeployDiagnosticsFrontDoor = "DeployIfNotExists"
  effect-DeployDiagnosticsFrontDoorCDN = "DeployIfNotExists"
  effect-DeployDiagnosticsGrafana = "DeployIfNotExists"
  effect-DeployDiagnosticsLoadBalancer = "DeployIfNotExists"
  effect-DeployDiagnosticsMySQL = "DeployIfNotExists"
  effect-DeployDiagnosticsMySQLFlexibleservers = "DeployIfNotExists"
  effect-DeployDiagnosticsNetworkSecurityGroups = "DeployIfNotExists"
  effect-DeployDiagnosticsNIC = "DeployIfNotExists"
  effect-DeployDiagnosticsNotificationHubs = "DeployIfNotExists"
  effect-DeployDiagnosticsNSG = "DeployIfNotExists"
  effect-DeployDiagnosticsPostgreSQL = "DeployIfNotExists"
  effect-DeployDiagnosticsPostgreSQLFlexibleservers = "DeployIfNotExists"
  effect-DeployDiagnosticsRedisCache = "DeployIfNotExists"
  effect-DeployDiagnosticsSA = "DeployIfNotExists"
  effect-DeployDiagnosticsSignalR = "DeployIfNotExists"
  effect-DeployDiagnosticsSQLMI = "DeployIfNotExists"
  effect-DeployDiagnosticsTrafficManager = "DeployIfNotExists"
  effect-DeployDiagnosticsVirtualNetwork = "DeployIfNotExists"
  effect-DeployDiagnosticsVM = "DeployIfNotExists"
  effect-DeployDiagnosticsVMSS = "DeployIfNotExists"
  effect-DeployDiagnosticsWebServerFarm = "DeployIfNotExists"
  effect-DeployDiagnosticsWebsiteFunction = "DeployIfNotExists"

}

module "AllowList-Initiative-core" {
  management_group_id = "/providers/Microsoft.Management/managementGroups/infras-core-mg"
  source = "./AllowList-Initiative"
  listOfAllowedLocations-AllowedLocationsForResourceGroups = ["eastus","westus"]
  listOfAllowedLocations-AllowedLocationsForResources = ["eastus","westus","global"]
  effect-AllowedLocationsForResourceGroups = "Deny"
  effect-AllowedLocationsForResources = "Deny"
  effect-AllowListWinServerLicenceVmss = "Deny"
  effect-AllowList-UbuntuServerSKUs = "Deny"
  effect-AllowList-RHELServerSKUs = "Deny"
  effect-AllowList-WinServerSKUs = "Deny"
  effect-AllowList-ResourceTypes = "Deny"
  effect-PIP-LimitSvcs = "Deny"
  allowListResourceTypesForAppTeams = ["microsoft.alertsmanagement/smartdetectoralertrules","microsoft.apimanagement/service","microsoft.app/containerapps","microsoft.app/managedenvironments","microsoft.appconfiguration/configurationstores","microsoft.automation/automationaccounts","microsoft.automation/automationaccounts/runbooks","microsoft.azureactivedirectory/b2cdirectories","microsoft.azureactivedirectory/ciamdirectories","microsoft.azurearcdata/sqlserverinstances","microsoft.azurearcdata/sqlserverinstances/databases","microsoft.cognitiveservices/accounts","microsoft.compute/availabilitysets","microsoft.compute/disks","microsoft.compute/images","microsoft.compute/proximityplacementgroups","microsoft.compute/restorepointcollections","microsoft.compute/snapshots","microsoft.compute/sshpublickeys","microsoft.compute/virtualmachines","microsoft.compute/virtualmachinescalesets","microsoft.containerregistry/registries","microsoft.databricks/accessconnectors","microsoft.databricks/workspaces","microsoft.datafactory/factories","microsoft.dbforpostgresql/flexibleservers","microsoft.documentdb/databaseaccounts","microsoft.eventgrid/namespaces","microsoft.eventgrid/systemtopics","microsoft.eventgrid/topics","microsoft.eventhub/namespaces","microsoft.fabric/capacities","microsoft.insights/actiongroups","microsoft.insights/activitylogalerts","microsoft.insights/components","microsoft.insights/datacollectionendpoints","microsoft.insights/datacollectionrules","microsoft.insights/scheduledqueryrules","microsoft.insights/workbooks","microsoft.keyvault/vaults","microsoft.loadtestservice/loadtests","microsoft.logic/workflows","microsoft.managedidentity/userassignedidentities","microsoft.maps/accounts","microsoft.network/applicationgateways","microsoft.network/applicationgatewaywebapplicationfirewallpolicies","microsoft.network/applicationsecuritygroups","microsoft.network/loadbalancers","microsoft.network/networkinterfaces","microsoft.network/networksecuritygroups","microsoft.network/networkwatchers","microsoft.network/networkwatchers/flowlogs","microsoft.network/privateendpoints","microsoft.network/routetables","microsoft.network/virtualnetworks","microsoft.operationalinsights/querypacks","microsoft.operationalinsights/workspaces","microsoft.operationsmanagement/solutions","microsoft.portal/dashboards","microsoft.portalservices/dashboards","microsoft.recoveryservices/vaults","microsoft.saas/resources","microsoft.search/searchservices","microsoft.signalrservice/signalr","microsoft.sql/servers","microsoft.sql/servers/databases","microsoft.sqlvirtualmachine/sqlvirtualmachines","microsoft.storage/storageaccounts","microsoft.storagesync/storagesyncservices","microsoft.visualstudio/account","microsoft.web/connectiongateways","microsoft.web/connections","microsoft.web/serverfarms","microsoft.web/sites","microsoft.web/sites/slots"]
  allowListResourceTypesPlatform = ["Microsoft.Network/privateDnsZones","Microsoft.Network/dnsForwardingRulesets","Microsoft.Network/dnsResolvers","Microsoft.Support/supportTickets","Microsoft.Authorization/policyAssignments","Microsoft.Authorization/roleAssignments","Microsoft.KeyVault/vaults","Microsoft.ManagedIdentity/userAssignedIdentities","Microsoft.Network/networkInterfaces","Microsoft.Network/networkSecurityGroups","Microsoft.Network/networkWatchers","Microsoft.Network/privateEndpoints","Microsoft.Network/privateLinkServices","Microsoft.Network/routeTables","Microsoft.Network/virtualNetworks","Microsoft.Resources/subscriptions/resourceGroups"]
  allowListRscProvidersPlatform = ["microsoft.insights","Microsoft.Security"]
}


module "ResourceControl-Initiative" {
  management_group_id = "/providers/Microsoft.Management/managementGroups/infras-core-mg"
  source = "./ResourceControl-Initiative"
  blockListResourceTypes-BlockList-ResourceTypes = ["Microsoft.Cdn/profiles","Microsoft.Network/azureFirewalls"]
  effect-BlockList-ResourceTypes = "Deny"
  actionNames-Organization-Rsc-Protect-NetWatcher =  ["delete"]
  effect-Organization-Rsc-Protect-NetWatcher = "DenyAction"
  actionNames-Organization-Rsc-Protect-Rt-Udr = ["delete"]
  effect-Organization-Rsc-Protect-Rt-Udr = "DenyAction"
  protectedRoutesNames-Organization-Rsc-Protect-Rt-Udr = ["udr-all-via-firewall"]

}


module "CompliantSKUs-Initiative" {
  management_group_id = "/providers/Microsoft.Management/managementGroups/infras-core-mg"
  source = "./CompliantSKUs-Initiative"
  effect-CompliantSKUsAPIManagementServiceVnet = "Deny"
  listOfAllowedSKUs-CompliantSKUsAPIManagementServiceVnet = ["Developer","Premium","Isolated"]
  effect-CompliantSKUsAppConfigUsePrivateLink = "Deny"
  effect-CompliantSKUsAppServiceAppUsePrivateLink = "Deny"
  effect-CompliantSKUsAzureCognitiveSearchUsePrivateLink = "Deny"
  effect-CompliantSKUsContainerRegistriesUsePrivateLink = "Deny"
  allowedSkuNames-CompliantSKUsPCDNonCompliantSKUEventHub = ["Standard","Premium"]
  effect-CompliantSKUsPCDNonCompliantSKUEventHub = "Deny"
  effect-CompliantSKUsPCDNonCompliantSKUsAGW = "Deny"
  effect-CompliantSKUsStrAccountLimitAllowedSKUs = "Deny"
  effect-DenyNonPremiumDatabricks = "Deny"
  listOfAllowedSKUs-CompliantSKUsStrAccountLimitAllowedSKUs = ["Standard_LRS","Standard_ZRS","StandardV2_LRS","StandardV2_ZRS"]
}
#________________________________________________________________________________________________________________________________________________________________
resource "time_sleep" "wait_for_vnet" {
  create_duration = var.sleep_create_duration
  depends_on      = [module.AllowList-Initiative-core,module.ApprovedVMExtensions-Initiative-core,module.CompliantSKUs-Initiative,module.DeployDiagnosticsSettings-Initiative-core,module.Disable-PubNetAccess-Initiative-core,module.ResourceControl-Initiative]
}
#________________________________________________________________________________________________________________________________________________________________

